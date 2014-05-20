Router.configure
  layoutTemplate: 'mainLayout'

Router.map ->
  this.route 'login',
    path: '/'

  this.route 'vms',
    path: '/vms'
