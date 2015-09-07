'use strict'

describe 'Directive: result', ->

  # load the directive's module and view
  beforeEach module 'generateFaviconApp'
  beforeEach module 'components/result/result.html'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope, $compile) ->
    scope   = $rootScope.$new()
    element = angular.element '<result></result>'
    element = $compile(element) scope
    scope.$apply()

  it 'should make hidden element visible', inject ->
    expect(element.find('.panel-heading').text()).toBe '下载'
