'use strict'

angular.module 'generateFaviconApp'
.config ($stateProvider) ->
  $stateProvider.state 'about',
    url: '/about'
    templateUrl: 'app/about/about.html'
    controller: 'AboutCtrl'
