'use strict'

angular.module 'generateFaviconApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'ui.bootstrap',
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
