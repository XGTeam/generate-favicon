'use strict'

describe 'Directive: uploadForm', ->

  # load the directive's module and view
  beforeEach module 'generateFaviconApp'
  beforeEach module 'components/uploadForm/uploadForm.html'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<upload-form></upload-form>'
    element = $compile(element) scope
    scope.$apply()
    expect(element.text()).toBe 'this is the uploadForm directive'
