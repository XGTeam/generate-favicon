'use strict'

angular.module 'generateFaviconApp'
.controller 'UploadFormCtrl', ($scope, Upload) ->
  $scope.uploadForm = {}

  $scope.submit = ->
    if form.file.$valid && $scope.file && !$scope.file.$error
      $scope.upload($scope.file)

  $scope.upload = (file) ->
