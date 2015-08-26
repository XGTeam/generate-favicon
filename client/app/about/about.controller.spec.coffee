'use strict'

describe 'Controller: AboutCtrl', ->

  # load the controller's module
  beforeEach module 'generateFaviconApp'
  AboutCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AboutCtrl = $controller 'AboutCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
