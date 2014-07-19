'use strict'

# Declare app level module which depends on filters, and services
@angular.module('myApp', ['ngRoute', 'myApp.filters', 'myApp.services', 'myApp.directives', 'config']).
    config ['$routeProvider', ($routeProvider) ->
        $routeProvider.
            when('/home', {templateUrl: 'partials/home.html', controller: MyCtrl1}).
            when('/view2', {templateUrl: 'partials/partial2.html', controller: MyCtrl2}).
            otherwise({redirectTo: '/home'})
        return
    ]
