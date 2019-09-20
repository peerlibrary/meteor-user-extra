Package.describe({
  name: 'peerlibrary:user-extra',
  summary: "Extended Meteor.userId() and Meteor.user()",
  version: '0.5.0',
  git: 'https://github.com/peerlibrary/meteor-user-extra.git'
});

Package.onUse(function (api) {
  api.versionsFrom('METEOR@1.8.1');

  // Core dependencies.
  api.use([
    'coffeescript@2.4.1',
    'ecmascript',
    'ddp',
    'accounts-base',
    'underscore'
  ]);

  // 3rd party dependencies.
  api.use([
    'peerlibrary:publish-context@0.7.0'
  ], 'server');

  api.addFiles([
    'server.coffee'
  ], 'server');

  api.addFiles([
    'lib.coffee'
  ]);
});

Package.onTest(function (api) {
  api.versionsFrom('METEOR@1.8.1');

  // Core dependencies.
  api.use([
    'coffeescript@2.4.1',
    'ecmascript',
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
    'peerlibrary:classy-test@0.4.0'
  ]);

  api.addFiles([
    'tests.coffee'
  ]);
});
