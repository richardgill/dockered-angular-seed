describe 'angularjs homepage', ->

  it 'should greet the named user', ->
        # Load the AngularJS homepage.
    browser.get('http://localhost:9000')
    expect(element(By.id('environment')).getText()).
      toEqual('test')
