# angular-seed with HAML, CoffeeScript, SASS and Cucumber

This is an extension of
[pensive612's](https://github.com/pensive612/angular-seed) fantastic
angular-seed fork which adds grunt for preprocessing

###Getting started

1. npm install to get the node modules you neeed
2. grunt watch will look for changes in the haml, coffee and sass files
and auto compile

####to run cucumber
1. ./script/web-server.js
2. cucumber.js -f pretty

## Original readme from pensive612
This version of angular-seed provides seed files for: [HAML](http://haml.info/), [CoffeeScript](http://coffeescript.org/), [SASS](http://sass-lang.com/), [SCSS](http://sass-lang.com/), [LESS](http://lesscss.org/) and [Stylus](http://learnboost.github.com/stylus/).

Each seed file can be removed if you don't want to use them.  Keep the version of the CSS preProcessor you like to use, delete the rest.  Delete HAML folders or CoffeeScript if its not your thing.  Totally up to you.

* If you don't want to use CoffeeScript, make sure to replace js files with the duplicates in js/_originals.  That way you don't have to deal with function wrappers.

### What's different

Each section has an additional folder named 'pre'.  Inside, is a respective preProcessor you might want to use with the project.

Including:

* **_pre** - This includes a HAML version of index.html.
* **partials/_pre** - Starter HAML files for both partials.
* **css/_pre** - Starter files for [SASS](http://sass-lang.com/), [SCSS](http://sass-lang.com/), [LESS](http://lesscss.org/) and [Stylus](http://learnboost.github.com/stylus/).  Whichever you might prefer.
* **js/_pre** - All js files built in CoffeeScript.
* **js/original** - Original js files.  In the event you want to use others, but not CoffeeScript.
  I would recommend reverting your js files back to the originals.

## Opinionated Branch

Okay, so this part is really just for me.  But I'm happy to share it if someone out there might find it useful.

The **opinionated** branch contains assets I am using as I set up demo projects, as well as minimal configuration options.

Quick highlights:

* [Twitter Bootstrap Less](http://twitter.github.com/bootstrap/) - Installed and configured with Font Awesome.
* [jQuery](http://jquery.com/) - Full version
* [UnderscoreJS](http://underscorejs.org/) - A utility library for JavaScript
* [Bourbon](https://github.com/thoughtbot/bourbon) - A Mixin Library for SASS
* Standard partials setup that I use for SASS


Hope you like it.  If its not your cup of tea.  Make sure to head back to [AngularJS on GitHub](https://github.com/angular/angular-seed/) for the original!

Below is the standard angular-seed README
****

# angular-seed — the seed for AngularJS apps

This project is an application skeleton for a typical [AngularJS](http://angularjs.org/) web app.
You can use it to quickly bootstrap your angular webapp projects and dev environment for these
projects.

The seed contains AngularJS libraries, test libraries and a bunch of scripts all preconfigured for
instant web development gratification. Just clone the repo (or download the zip/tarball), start up
our (or yours) webserver and you are ready to develop and test your application.

The seed app doesn't do much, just shows how to wire two controllers and views together. You can
check it out by opening app/index.html in your browser (might not work file `file://` scheme in
certain browsers, see note below).

_Note: While angular is client-side-only technology and it's possible to create angular webapps that
don't require a backend server at all, we recommend hosting the project files using a local
webserver during development to avoid issues with security restrictions (sandbox) in browsers. The
sandbox implementation varies between browsers, but quite often prevents things like cookies, xhr,
etc to function properly when an html page is opened via `file://` scheme instead of `http://`._


## How to use angular-seed

Clone the angular-seed repository and start hacking...


### Running the app during development

You can pick one of these options:

* serve this repository with your webserver
* install node.js and run `scripts/web-server.js`

Then navigate your browser to `http://localhost:<port>/app/index.html` to see the app running in
your browser.


### Running the app in production

This really depends on how complex is your app and the overall infrastructure of your system, but
the general rule is that all you need in production are all the files under the `app/` directory.
Everything else should be omitted.

Angular apps are really just a bunch of static html, css and js files that just need to be hosted
somewhere, where they can be accessed by browsers.

If your Angular app is talking to the backend server via xhr or other means, you need to figure
out what is the best way to host the static files to comply with the same origin policy if
applicable. Usually this is done by hosting the files by the backend server or through
reverse-proxying the backend server(s) and a webserver(s).


### Running unit tests

We recommend using [jasmine](http://pivotal.github.com/jasmine/) and
[Testacular](http://vojtajina.github.com/testacular/) for your unit tests/specs, but you are free
to use whatever works for you.

Requires [node.js](http://nodejs.org/), Testacular (`sudo npm install -g testacular`) and a local
or remote browser.

* start `scripts/test.sh` (on windows: `scripts\test.bat`)
  * a browser will start and connect to the Testacular server (Chrome is default browser, others can be captured by loading the same url as the one in Chrome or by changing the `config/testacular.conf.js` file)
* to run or re-run tests just change any of your source or test javascript files


### End to end testing

Angular ships with a baked-in end-to-end test runner that understands angular, your app and allows
you to write your tests with jasmine-like BDD syntax.

Requires a webserver, node.js + `./scripts/web-server.js` or your backend server that hosts the angular static files.

Check out the
[end-to-end runner's documentation](http://docs.angularjs.org/guide/dev_guide.e2e-testing) for more
info.

* create your end-to-end tests in `test/e2e/scenarios.js`
* serve your project directory with your http/backend server or node.js + `scripts/web-server.js`
* to run do one of:
  * open `http://localhost:port/test/e2e/runner.html` in your browser
  * run the tests from console with [Testacular](vojtajina.github.com/testacular) via
    `scripts/e2e-test.sh` or `script/e2e-test.bat`

### Continuous Integration

CloudBees have provided a CI/deployment setup:

<a href="https://grandcentral.cloudbees.com/?CB_clickstart=https://raw.github.com/CloudBees-community/angular-js-clickstart/master/clickstart.json"><img src="https://d3ko533tu1ozfq.cloudfront.net/clickstart/deployInstantly.png"/></a>

If you run this, you will get a cloned version of this repo to start working on in a private git repo, 
along with a CI service (in Jenkins) hosted that will run unit and end to end tests in both Firefox and Chrome.

### Receiving updates from upstream

When we upgrade angular-seed's repo with newer angular or testing library code, you can just
fetch the changes and merge them into your project with git.


## Directory Layout

    app/                --> all of the files to be used in production
      css/              --> css files
        app.css         --> default stylesheet
      img/              --> image files
      index.html        --> app layout file (the main html template file of the app)
      index-async.html  --> just like index.html, but loads js files asynchronously
      js/               --> javascript files
        app.js          --> application
        controllers.js  --> application controllers
        directives.js   --> application directives
        filters.js      --> custom angular filters
        services.js     --> custom angular services
      lib/              --> angular and 3rd party javascript libraries
        angular/
          angular.js        --> the latest angular js
          angular.min.js    --> the latest minified angular js
          angular-*.js      --> angular add-on modules
          version.txt       --> version number
      partials/             --> angular view partials (partial html templates)
        partial1.html
        partial2.html

    config/testacular.conf.js        --> config file for running unit tests with Testacular
    config/testacular-e2e.conf.js    --> config file for running e2e tests with Testacular

    scripts/            --> handy shell/js/ruby scripts
      e2e-test.sh       --> runs end-to-end tests with Testacular (*nix)
      e2e-test.bat      --> runs end-to-end tests with Testacular (windows)
      test.bat          --> autotests unit tests with Testacular (windows)
      test.sh           --> autotests unit tests with Testacular (*nix)
      web-server.js     --> simple development webserver based on node.js

    test/               --> test source files and libraries
      e2e/              -->
        runner.html     --> end-to-end test runner (open in your browser to run)
        scenarios.js    --> end-to-end specs
      lib/
        angular/                --> angular testing libraries
          angular-mocks.js      --> mocks that replace certain angular services in tests
          angular-scenario.js   --> angular's scenario (end-to-end) test runner library
          version.txt           --> version file
      unit/                     --> unit level specs/tests
        controllersSpec.js      --> specs for controllers
        directivessSpec.js      --> specs for directives
        filtersSpec.js          --> specs for filters
        servicesSpec.js         --> specs for services

## Contact

For more information on AngularJS please check out http://angularjs.org/
