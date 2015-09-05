'use strict'

class ProgressBar
  constructor: ->
    @display = false
    @percent = 0

  show: ->
    @display = true

  hide: ->
    @display = false

angular.module 'generateFaviconApp'
.controller 'UploadFormCtrl', ['$scope', 'Upload', ($scope, Upload) ->
  # Progress bar
  $scope.progressbar = new ProgressBar()

  # form submit
  $scope.submit = ->
    if $scope.form.file.$valid && $scope.form.file
      $scope.upload($scope.file)

  $scope.upload = (file) ->
    $scope.progressbar.show()
    Upload.upload
      url : '/api/favicons'
      file: file
    .progress (evt) ->
      progressPercentage = parseInt(100.0 * evt.loaded / evt.total)
      $scope.progressbar.percent = progressPercentage
    .success (data) ->
      console.log 'upload success'
    .error (data, status, headers, config) ->
      $scope.progressbar.hide()
]
