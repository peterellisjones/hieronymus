@Deployments = new Meteor.Collection("deployments", connection: null)
@Vms = new Meteor.Collection("vms", connection: null)

Meteor.startup () ->
  poll_bosh_vms()
  handler = Meteor.setInterval(poll_bosh_vms, 10000)
  Session.set('bosh_poll', handler)

@poll_bosh_vms = () ->
  if loggedIn
    console.log "synchronizing..."
    sync_deployments(sync_deployment_vms)


sync_deployments = (callback = null) ->
  bosh_get '/deployments', {}, true, (deployments) ->
    for deployment in deployments
      deployment._id = deployment.name
      Deployments.upsert(_id: deployment._id, deployment)
    callback() if callback?

sync_deployment_vms = (callback = null) ->
  Deployments.find(name: 'cf-mongodb').forEach (deployment) ->
    get_vms_info deployment.name, (vms) ->
      for vm in vms
        vm.deployment_id = deployment._id
        vm._id = vm.agent_id
        Vms.upsert(_id: vm._id, vm)
      callback() if callback?

get_vms_info = (deployment_name, callback) ->
  path = "/deployments/#{deployment_name}/vms"
  options =
    query: 'format=full'
  bosh_get path, options, true, (res) ->
    if res.statusCode == 302 and res.headers.location
      pollTaskUntilResult res.headers.location, (vmJson) ->
        callback (JSON.parse(vm) for vm in vmJson.split(/\n/) when vm != '')
    else
      callback(res)

pollTaskUntilResult = (location, callback) ->
  uri = uri_parser(location)
  path = uri.pathname
  options =
    query: uri.search
  taskPoller path, options, () ->
    bosh_get "#{path}/output", { query: "type=result" }, false, callback


taskPoller = (path, options, callback, retries = 100) ->
  return unless retries >= 0
  bosh_get path, options, true, (result) ->
    if result.state in ['queued', 'processing']
      taskPoller(path, options, callback, retries - 1)
    else if result.state in ['cancelled', 'error']
      throw res
    else
      callback()

uri_parser = (uri) ->
  parser = document.createElement('a')
  parser.href = uri
  parser
