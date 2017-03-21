Meteor.userId = ->
  currentInvocation = DDP._CurrentInvocation.get()

  return currentInvocation.userId if currentInvocation

  currentContext = DDP._CurrentPublish.get()

  return currentContext.userId if currentContext

  throw new Error "Meteor.userId() not invoked from a method or publish function."

# Forbid users from making any modifications to their user document.
Meteor.users.deny
  update: ->
    true
