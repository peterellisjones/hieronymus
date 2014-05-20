@bosh_get = (path, options, parseResult, callback) ->
  bosh_target = Session.get('bosh_target') or 'https://192.168.50.4:25555'
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
  username = Session.get('bosh_username') or 'admin'
  password = Session.get('bosh_password') or 'admin'
  "Basic #{btoa("#{username}:#{password}")}"
