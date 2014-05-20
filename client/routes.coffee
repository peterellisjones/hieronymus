Router.configure
  layoutTemplate: 'mainLayout'

Router.onBeforeAction () ->
  if this.path != '/' and !loggedIn()
    Router.go('/')

Router.map ->
  this.route 'login',
    path: '/'

  this.route 'vms',
    path: '/vms'
