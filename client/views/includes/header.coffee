Template.header.helpers
  pageTitle: ->
    Session.get('pageTitle') ? 'App Name'
