module.exports = (config) ->
  config.set
    basePath: '../'
    frameworks: ['jasmine']

		files: [
		  'app/bower_components/angular/angular.js',
		  'app/bower_components/angular-mocks/angular-mocks.js',
		  'app/bower_components/angular-resource/angular-resource.js',
		  'app/bower_components/angular-cookies/angular-cookies.js',
		  'app/bower_components/angular-sanitize/angular-sanitize.js',
		  'app/bower_components/angular-route/angular-route.js',
		  'app/js/**/*.js',
		  'test/unit/**/*.js'
		];

		autoWatch: true

		browsers: ['Firefox']

		junitReporter: 
		  outputFile: 'test_out/unit.xml'
		  suite: 'unit'

