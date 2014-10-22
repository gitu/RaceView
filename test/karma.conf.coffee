# Karma configuration
# http://karma-runner.github.io/0.12/config/configuration-file.html
# Generated on 2014-10-02 using
# generator-karma 0.8.3

module.exports = (config) ->
  config.set
  # base path, that will be used to resolve files and exclude
    basePath: '../'

  # testing framework to use (jasmine/mocha/qunit/...)
    frameworks: ['jasmine']

  # list of files / patterns to load in the browser
    files: [
      'bower_components/es5-shim/es5-shim.js'
      'bower_components/json3/lib/json3.min.js'
      'bower_components/jquery/dist/jquery.js'
      'bower_components/angular/angular.js'
      'bower_components/angular-mocks/angular-mocks.js'
      'bower_components/json3/lib/json3.js'
      'bower_components/angular-route/angular-route.js'
      'bower_components/firebase/firebase.js'
      'bower_components/firebase-simple-login/firebase-simple-login.js'
      'bower_components/mockfirebase/dist/mockfirebase.js'
      'bower_components/angularfire/dist/angularfire.min.js'
      'bower_components/bootstrap/dist/js/bootstrap.js'
      'bower_components/fastclick/lib/fastclick.js'
      'bower_components/angular-animate/angular-animate.js'
      'bower_components/angular-aria/angular-aria.js'
      'bower_components/hammerjs/hammer.js'
      'bower_components/angular-material/angular-material.js'
      'bower_components/angularytics/dist/angularytics.min.js'

      'app/scripts/**/*.coffee'
      'app/scripts/angularfire/*.js'
      'app/scripts/directives/ngHideAuth.js'
      'app/scripts/services/iopctrl.js'
      'app/scripts/directives/ngShowAuth.js'
      'test/mock/**/*.coffee'
      'test/spec/**/*.coffee'
    ],

  # list of files / patterns to exclude
    exclude: []

  # web server port
    port: 8080

  # level of logging
  # possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO

  # Start these browsers, currently available:
  # - Chrome
  # - ChromeCanary
  # - Firefox
  # - Opera
  # - Safari (only Mac)
  # - PhantomJS
  # - IE (only Windows)
    browsers: [
      'PhantomJS'
    ]

  # Which plugins to enable
    plugins: [
      'karma-phantomjs-launcher'
      'karma-jasmine'
      'karma-coffee-preprocessor'
    ]

  # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true

  # Continuous Integration mode
  # if true, it capture browsers, run tests and exit
    singleRun: false

    colors: true

    preprocessors:
      '**/*.coffee': ['coffee']

# Uncomment the following lines if you are using grunt's server to run the tests
# proxies: '/': 'http://localhost:9000/'
# URL root prevent conflicts with the site root
# urlRoot: '_karma_'
