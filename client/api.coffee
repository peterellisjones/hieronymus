@bosh_get = (path, options, parseResult, callback) ->
  bosh_target = Session.get('bosh_target')
  options or= {}
  options.headers or= {}
  options.headers['Authorization'] = basic_auth_header()
  url = "#{bosh_target}#{path}"
  Meteor.call 'get', url, options, (err, res) ->
    throw err if err
    if res.content
      if parseResult
        parsed = JSON.parse(res.content)
        callback(parsed)
      else
        callback(res.content)
    else
      callback(res)

basic_auth_header = () ->
  username = Session.get('bosh_username')
  password = Session.get('bosh_password')
  "Basic #{btoa("#{username}:#{password}")}"
