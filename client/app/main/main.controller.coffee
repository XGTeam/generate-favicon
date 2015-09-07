'use strict'

angular.module 'generateFaviconApp'
.controller 'MainCtrl', ($scope, $state) ->
  $scope.uploaded = false

  $scope.reloadRoute = ->
    $state.reload()

  $scope.$on 'uploaded', (evt, data)->
    $scope.uploaded = true
    $scope.link     = data.path
    $scope.file     = data.file
