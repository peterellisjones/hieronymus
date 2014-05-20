Template.login.events
  'submit form': (e) ->
    e.preventDefault()
    username = $(e.currentTarget).find('input#username').val()
    boshDirectorUrl = $(e.currentTarget).find('input#bosh_director_url').val()
    password = $(e.currentTarget).find('input#password').val()
    if username? and boshDirectorUrl? and password?
      Session.set 'bosh_username', username
      Session.set 'bosh_target', boshDirectorUrl
      Session.set 'bosh_password', password
      currentPollHandler = Session.get('bosh_poll')

      if currentPollHandler?
        Meteor.clearInterval(currentPollHandler)

      poll_bosh_vms
      handler = Meteor.setInterval(poll_bosh_vms, 10000)
      Session.set('bosh_poll', handler)
      Router.go('vms')

Template.login.submit_text = () ->
  comments = [
    'Oh my BOSH!',
    "BOSH me I'm Irish!",
    'Go BOSH yourself!',
    "If I were a president I'd be George BOSHington!"
  ]
  comments[Math.floor(Math.random() * comments.length)]
