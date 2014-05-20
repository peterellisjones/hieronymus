Meteor.methods
  get: (url, options) ->
    options.headers or= {}
    options.headers['Accept'] or= 'application/json'
    options.headers['Content-Type'] or= 'application/json'
    options.followRedirects = false
    console.log "Fetching: #{url}"
    res = HTTP.get(url, options)
    res
