'use strict'

angular.module 'generateFaviconApp'
.controller 'NavbarCtrl', ($scope) ->
  $scope.menu = [
    title: '首页'
    state: 'main'
  ,
    title: '关于Favicon',
    state: 'about.favicon'
  ]

  $scope.isCollapsed = true

  $scope.count = ->
    $scope.menu.length
