describe 'service', ->
  beforeEach module('myApp.services')

  describe 'version123', ->
    it 'should return current version', inject (version123) ->
      expect(version123).toEqual('123')
