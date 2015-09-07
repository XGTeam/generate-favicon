'use strict'

angular.module 'generateFaviconApp'
.controller 'MainCtrl', ($scope, $http) ->
  $scope.uploaded = false

  $scope.$on 'uploaded', (evt, data)->
    $scope.uploaded = true
