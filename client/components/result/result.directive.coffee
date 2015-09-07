'use strict'

angular.module 'generateFaviconApp'
.directive 'result', ->
  templateUrl: 'components/result/result.html'
  restrict: 'EA'
  link: (scope, element, attrs) ->
