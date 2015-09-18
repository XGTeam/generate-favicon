'use strict'

angular.module 'generateFaviconApp'
.controller 'MainCtrl', ($scope, $state, $mdDialog) ->
  $scope.uploaded = false

  $scope.$on 'uploaded', (evt, data)->
    $mdDialog.show
      controller: ($scope, $mdDialog, link, file, $state) ->
        $scope.link = link
        $scope.file = file

        $scope.reloadRoute = ->
          $state.reload()

        $scope.hide = ->
          $mdDialog.hide()

        $scope.cancel = ->
          $mdDialog.cancel()
          $scope.reloadRoute()

        $scope.share = ->
          $mdDialog.hide()

      templateUrl: 'components/result/result.html'
      parent: angular.element(document.body)
      clickOutsideToClose: false
      locals: link: data.path, file: data.file
    .then ->
      $scope.$emit 'sharing'
