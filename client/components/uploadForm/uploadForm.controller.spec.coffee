'use strict'

describe 'Controller: uploadFormCtrl', ->
  beforeEach module 'generateFaviconApp'
  scope      = undefined
  UploadCtrl = undefined
  progressbar= undefined

  beforeEach inject ($rootScope, $controller) ->
    scope       = $rootScope.$new()
    UploadCtrl  = $controller 'UploadFormCtrl',
      $scope: scope
    progressbar = scope.progressbar

  it 'should have a variable to presents progressbar', ->
    expect(progressbar).toBeDefined()

  it 'should have a variable to display progressbar', ->
    expect(progressbar.display).toBe false

  it 'progress bar\'s percent should be 0 when initialize', ->
    expect(progressbar.percent).toEqual 0

  it 'should display the progress bar when invoke show method', ->
    progressbar.show()
    expect(progressbar.display).toBe true

  it 'should hide the progress bar when invoke hide method', ->
    progressbar.hide()
    expect(progressbar.display).toBe false
