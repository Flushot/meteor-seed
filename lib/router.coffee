### Config ###

Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

### Routes ###

Router.map ->
  @route 'home', path: '/'

### Hooks ###

# Requires that user is logged in, or forbids access
requireLogin = (pause) ->
  if not Meteor.user()?
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render 'accessDenied'
    pause()

Router.onBeforeAction requireLogin, only: 'postSubmit'
