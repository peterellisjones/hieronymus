Meteor.methods
  get: (url, options) ->
    options.headers or= {}
    options.headers['Accept'] or= 'application/json'
    options.headers['Content-Type'] or= 'application/json'
    options.followRedirects = false
    res = HTTP.get(url, options)
    res

  post: (args...) ->
    HTTP.post.apply(null, args)
  put: (args...) ->
    HTTP.put.apply(null, args)
