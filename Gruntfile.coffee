module.exports = (grunt) ->
  mountFolder = (connect, dir) -> connect.static(require('path').resolve(dir))

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    concurrent:
      appwatch: ['connect:app:keepalive', 'watch']
      testwatch: ['connect:test:keepalive', 'watch']
      e2etests: ['connect:test:keepalive', 'protractor:e2e']

      options: logConcurrentOutput: true


    clean:
      files: ["tmp/", "dist/"]

    haml:
      app:
        files: [
          expand: true,
          cwd: './_app/',
          src: ['**/*.haml'],
          dest: 'dist/app/',
          ext: '.html',
          flatten: false
        ]

    sass:
      dist:
        files:
          'dist/app/css/app.css' : '_app/css/app.sass'

    bowerComponents:
      dist:
        files:
          'bower_components/**/*' : 'dist/app/bower_components'

    coffee:
      scripts:
        files: [
          expand: true,
          cwd: './_app/js',
          src: ['*.coffee'],
          dest: 'dist/app/js',
          ext: '.js'
        ,
          expand: true,
          cwd: './_test/e2e',
          src: ['*.coffee'],
          dest: 'dist/test/e2e',
          ext: '.js'
        ,
          expand: true,
          cwd: './_test/unit',
          src: ['*.coffee'],
          dest: 'dist/test/unit',
          ext: '.js'
        ]

    watch:
      options:
        livereload: true

      js:
        files: ['_app/js/*', '_test/**/*']
        tasks: ['coffee']

      css:
        files: ['_app/css/*']
        tasks: ['sass']

      haml:
        files: ['_app/*', '_app/partials/*']
        tasks: ['haml', 'bowerInstall']


    connect:
      app:
        options:
          port: 9000
          middleware: (connect, options) ->
            [
              # Either grap our ip from environment variable or from ip library.
              require('connect-livereload')(src: "http://#{process.env.IP || require('ip').address()}:35729/livereload.js?snipver=1"),
              mountFolder(connect, '.tmp'),
              mountFolder(connect, 'dist/app')
            ]

      test:
        options:
          port: 9000
          middleware: (connect, options) ->
            process.env.ENVIRONMENT = "TEST"
            [
              # Either grap our ip from environment variable or from ip library.
              require('connect-livereload')(src: "http://#{process.env.IP || require('ip').address()}:35729/livereload.js?snipver=1"),
              mountFolder(connect, '.tmp'),
              mountFolder(connect, 'dist/app')
            ]

    bowerInstall:
      target:

        src: [
          "dist/app/index.html"
        ]

    copy:
      bowerComponents:
        files: [
          expand: true, src: ['bower_components/**/*'], dest: 'dist/app/'
        ]



    karma:
      unit:
        configFile: 'config/karma.conf.coffee'

    protractor:
      e2e:
        configFile: "config/protractor-e2e.conf.js",
        keepAlive: false
        noColor: true


    ngconstant:
      options:
        name: 'config'
        dest: 'dist/app/js/config.js'
        constants:
          version: '0.9.0'

      development:
        constants:
          environment: 'development'

      test:
        constants:
          environment: 'test'

  grunt.loadTasks "tasks"

  grunt.loadNpmTasks('grunt-haml')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-concurrent')
  grunt.loadNpmTasks('grunt-bower-install')
  grunt.loadNpmTasks('grunt-karma')
  grunt.loadNpmTasks('grunt-protractor-runner');
  grunt.loadNpmTasks('grunt-ng-constant');
  grunt.loadNpmTasks('grunt-sass');

  grunt.registerTask "default", ["clean", "haml", "coffee", "sass", "bowerInstall", "copy:bowerComponents"]
  grunt.registerTask "build", ["clean", "haml", "coffee", "sass", "bowerInstall", "copy:bowerComponents", "ngconstant:#{process.env.ENVIRONMENT}"]
  grunt.registerTask "serve", ["build", "concurrent:appwatch"]
  grunt.registerTask "test-serve", ["build", "ngconstant:test", "concurrent:testwatch"]
  grunt.registerTask "e2e-tests", ["build", "ngconstant:test", "concurrent:e2etests"]
  grunt.registerTask "unit-tests-watch", ["karma"]
