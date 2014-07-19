(function() {
  describe('angularjs homepage', function() {
    return it('should greet the named user', function() {
      browser.get('http://localhost:9000');
      return expect(element(By.id('environment')).getText()).toEqual('test');
    });
  });

}).call(this);
