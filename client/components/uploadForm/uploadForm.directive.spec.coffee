'use strict'

describe 'Directive: uploadForm', ->

  # load the directive's module and view
  beforeEach module 'generateFaviconApp'
  beforeEach module 'components/uploadForm/uploadForm.html'
  element = undefined
  scope   = undefined
  form    = undefined
  beforeEach inject ($rootScope, $compile) ->
    scope   = $rootScope.$new()
    element = angular.element '<upload-form></upload-form>'
    element = $compile(element) scope
    scope.$apply()

    form    = element.find 'form#upload-favicon-form'

  it 'should make hidden element visible', inject ->
    expect(element.find('h3').text()).toBe '生成你的favicon.ico'

  it 'should have a visible form', inject ->
    expect(form.length).toEqual 1

  it 'should have a submit button', inject ->
    expect(form.find('button[type=submit]').text()).toBe '生成'

  it 'should have a ng upload select button', inject ->
    expect(form.find('[ngf-select]').length).toEqual 1
