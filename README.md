Extended Meteor.userId() and Meteor.user()
==========================================

Adding this package to your [Meteor](http://www.meteor.com/) application:

* makes [`Meteor.userId()`](http://docs.meteor.com/#/full/meteor_userid)
  work also inside the publish endpoint functions
* prevents direct modification of the user's profile from the client, which
  is otherwise allowed by Meteor
* extends [`Meteor.user(userId)`](http://docs.meteor.com/#/full/meteor_user)
  into `Meteor.user(userId, fields)` which now accepts an argument to limit
  queried fields (and thus function's reactivity); `userId` is optional and if
  not specified `Meteor.userId()` is used instead

Both client and server side.

Installation
------------

```
meteor add peerlibrary:user-extra
```

Examples
--------

```javascript
Template.user.helpers({
  username: function () {
    var user = Meteor.user({username: 1});
    return user && user.username;
  }
});
```
