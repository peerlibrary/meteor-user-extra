if Meteor.isServer
  Meteor.publish 'userExtraTest', ->
    @added 'testCollection', Random.id(),
      userId: Meteor.userId()
    @ready()

else
  TestCollection = new Mongo.Collection 'testCollection'

class BasicTestCase extends ClassyTestCase
  @testName: 'user-extra - basic'

  setUpServer: ->
    Meteor.users.remove
      username: 'test-user-extra'

  tearDownServer: ->
    Meteor.users.remove
      username: 'test-user-extra'

  testClientBasic: [
    ->
      @assertSubscribeSuccessful 'userExtraTest', @expect()
  ,
    ->
      @assertEqual Meteor.userId(), null
      @assertEqual TestCollection.find({}, fields: {_id: 0}).fetch(), [userId: null]
  ,
    ->
      Accounts.createUser
        username: 'test-user-extra'
        password: 'test'
        email: 'test@example.com'
      ,
        @expect (error) =>
          @assertFalse error, error
  ,
    @runOnServer ->
      @assertTrue Meteor.userId()

      @set 'userId', Meteor.userId()
  ,
    ->
      @assertEqual Meteor.userId(), @get 'userId'
      @assertEqual TestCollection.find({}, fields: {_id: 0}).fetch(), [userId: Meteor.userId()]
  ,
    ->
      Meteor.users.update Meteor.userId(),
        $set:
          profile:
            name: 'test'
      ,
        @expect (error, changes) =>
          # Updating the user profile should not be allowed.
          @assertTrue error, error
  ,
    ->
      @assertTrue Meteor.user().emails
      @assertFalse Meteor.user({username: 1}).emails
  ,
    ->
      Accounts.logout @expect (error) =>
        @assertFalse error, error
  ,
    ->
      @assertEqual Meteor.userId(), null
      @assertEqual TestCollection.find({}, fields: {_id: 0}).fetch(), [userId: null]
  ]

ClassyTestCase.addTest new BasicTestCase()
