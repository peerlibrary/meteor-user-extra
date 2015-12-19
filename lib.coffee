Meteor.user = (userId, fields) ->
  if not fields and _.isObject userId
    fields = userId
    userId = null

  # Meteor.userId is reactive.
  userId ?= Meteor.userId()
  fields ?= {}

  return null unless userId

  Meteor.users.findOne
    _id: userId
  ,
    fields: fields
