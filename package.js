Package.describe({
  name: 'peerlibrary:user-extra',
  summary: "Extended Meteor.userId() and Meteor.user()",
  version: '0.1.3',
  git: 'https://github.com/peerlibrary/meteor-user-extra.git'
});

Package.onUse(function (api) {
  api.versionsFrom('METEOR@1.3.4.4');

  // Core dependencies.
  api.use([
    'coffeescript',
    'ddp',
    'accounts-base',
    'underscore'
  ]);

  // 3rd party dependencies.
  api.use([
    'peerlibrary:publish-context@0.1.0'
  ], 'server');

  api.addFiles([
    'server.coffee'
  ], 'server');

  api.addFiles([
    'lib.coffee'
  ]);
});

Package.onTest(function (api) {
  api.versionsFrom('METEOR@1.3.4.4');

  // Core dependencies.
  api.use([
    'coffeescript',
    'accounts-password',
    'random',
    'mongo'
  ]);

  // Internal dependencies.
  api.use([
    'peerlibrary:user-extra'
  ]);

  // 3rd party dependencies.
  api.use([
    'peerlibrary:classy-test@0.2.26'
  ]);

  api.addFiles([
    'tests.coffee'
  ]);
});
