'use strict'

angular.module 'generateFaviconApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'ngFileUpload',
  'ngMaterial'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider, $mdThemingProvider) ->
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true

  $mdThemingProvider.theme('default')
    .primaryPalette('blue-grey')
    .accentPalette('green', default: '600')
    .warnPalette('red')
    .backgroundPalette('grey')

.controller 'AppCtrl', ($scope, $mdSidenav) ->
  $scope.menu = [
    title: '首页'
    state: 'main'
  ,
    title: '关于'
    state: 'about'
  ]

  $scope.toggleMenu = ->
    $mdSidenav('left').toggle()
