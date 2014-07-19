'use strict'

# Directives

@angular.module('myApp.directives', [])
	.directive('appVersion', ['version', (version) ->
		return (scope, elm, attrs) ->
			elm.text(version)
	])
	.directive('appEnvironment', ['environment', (environment) ->
		return (scope, elm, attrs) ->
			elm.text(environment)
	])
