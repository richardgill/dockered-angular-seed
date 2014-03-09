
describe 'directives', ->
  beforeEach(module('myApp.directives'))

  describe 'app-version', ->
    it 'should print current version', ->
      module ($provide) ->
        $provide.value('version', 'TEST_VER')
        null

      inject ($compile, $rootScope) ->
        element = $compile('<span app-version></span>')($rootScope)
        expect(element.text()).toEqual('TEST_VER')
