'use strict'

angular.module 'generateFaviconApp'
.directive 'uploadForm', ->
  templateUrl: 'components/uploadForm/uploadForm.html'
  restrict: 'EA'
  link: (scope, element, attrs) ->
