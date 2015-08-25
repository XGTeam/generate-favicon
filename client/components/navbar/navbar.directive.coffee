'use strict'

angular.module 'generateFaviconApp'
.directive 'navbar', ->
  templateUrl: 'components/navbar/navbar.html'
  restrict: 'E'
  controller: 'NavbarCtrl'
