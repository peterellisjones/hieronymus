@loggedIn = () ->
  Session.get('bosh_username')? and Session.get('bosh_password') and Session.get('bosh_target')
