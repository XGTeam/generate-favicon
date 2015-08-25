'use strict'

angular.module 'generateFaviconApp'
.controller 'NavbarCtrl', ($scope) ->
  $scope.menu = [
    title: 'Home'
    state: 'main'
  ]
  $scope.isCollapsed = true
