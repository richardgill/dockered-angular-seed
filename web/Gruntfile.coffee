module.exports = (grunt) ->
  mountFolder = (connect, dir) -> connect.static(require('path').resolve(dir))

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      files: ["tmp/"]

    haml:
      app:
        files: 
          "app/index.html" : "_app/index.haml"
          "app/partials/partial1.html" : "_app/partials/partial1.haml"
          "app/partials/partial2.html" : "_app/partials/partial2.haml"

    sass:
      dist:
        files: 
          'app/css/app.css' : '_app/css/app.sass'

    coffee:
      scripts: 
        files: [
          expand: true,
          cwd: './_app/js',
          src: ['*.coffee'],
          dest: 'app/js',
          ext: '.js'
        ,
          expand: true,
          cwd: './_test/e2e',
          src: ['*.coffee'],
          dest: './test/e2e',
          ext: '.js'
        ,
          expand: true,
          cwd: './_test/unit',
          src: ['*.coffee'],
          dest: './test/unit',
          ext: '.js'
        ]

    watch:
      options: 
        livereload: true

      js:
        files: ['_app/js/*', '_test/**/*']
        tasks: ['coffee']
        options:
          livereload: true
        

      css:
        files: ['_app/css/*']
        tasks: ['sass']

      haml:
        files: ['_app/*', '_app/partials/*']
        tasks: ['haml']
        options:
          livereload: true

      livereload:
        options:  
          livereload: true
        files: ['app/**/*.html']
    

    connect:
      server:
        options: 
          port: 9000
          middleware: (connect, options) -> 
            [
            
              require('connect-livereload')(src: "http://#{require('ip').address()}:35729/livereload.js?snipver=1"),
              mountFolder(connect, '.tmp'),
              mountFolder(connect, 'app')
            ]

 
      

  grunt.loadTasks "tasks"

  grunt.loadNpmTasks('grunt-haml')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-connect')

  grunt.registerTask "default", ["clean", "haml", "coffee", "sass"]

