(function(){define("config",[],function(){return{ngApp:"radian",api:{data:"/data/menu.json"},path:{partial:"/assets/partial/"}}})}).call(this),function(){define("startup",["config","angular"],function(e,t){return require(["angular-resource","angular-route"],function(){return t.module(e.ngApp,["ngResource","ngRoute"]),require(["controller/app-controller"],function(){return t.bootstrap(document.documentElement,[e.ngApp])})})})}.call(this),function(){require.config({baseUrl:"/assets/js/",paths:{angular:"//ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular.min","angular-resource":"//ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular-resource.min","angular-route":"//ajax.googleapis.com/ajax/libs/angularjs/1.2.5/angular-route.min",lodash:"//cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.min"},shim:{angular:{exports:"angular"},lodash:{exports:"_"}}}),require(["startup"])}.call(this),define("app",function(){}),function(){define("partials",["config","angular"],function(e,t){var n,r;return r=function(e){e.put("/assets/partial/code-partial.html",'<div id="code"><h1 id="the-code">The Code</h1><p>Radian contains the documentation as comments in the source code of its files. Also to jazz things up a bit I&#39;ve run the code through the awesome <a href="http://jashkenas.github.io/docco/">Docco</a> and <a href="docs/app.html" target="_self">the generated docs are also available</a> for your browsing pleasure.</p><p>Radian has three major parts to it:</p><ul><li>The app code</li><li>The local tasks and helpers</li><li>The tests</li></ul><p>Here&#39;s an overview of these bases and you can follow the code documentation onwards:</p><h2 id="the-app-code">The app code</h2><p>Remember that Radian is simply an abstract of how to develop <a href="http://angularjs.org">AngularJS</a> in a scalable manner. We begin our journey by looking at how the use of AMD available from <a href="http://requirejs.org">RequireJS</a> helps bring things together: jump to <a href="docs/app.html" target="_self"><code>app.coffee</code></a>.</p><h2 id="the-local-tasks-and-helpers">The local tasks and helpers</h2><p>There are three main local tasks:</p><ul><li>The grunt tasks (<a href="docs/gruntfile.html" target="_self"><code>Gruntfile.coffee</code></a>)</li><li>The local server (<a href="docs/server.html" target="_self"><code>server.coffee</code></a>)</li><li>The web crawler (<a href="docs/crawler.html" target="_self"><code>crawler.coffee</code></a>)</li></ul><p>And not forgetting the <a href="https://github.com/ahmednuaman/generator-radian">Yeoman generator</a>.</p><h3 id="the-grunt-tasks">The grunt tasks</h3><p><a href="http://gruntjs.com">Grunt</a> is a great utility. It&#39;s used to run all the preprocessors that the app uses and also used to put everything into place when the app is built. The task that you&#39;ll probably use the most is the default <code>grunt</code> task; this does the following:</p><ul><li>Installs the <a href="http://bower.io">Bower</a> dependancies</li><li>Runs the <a href="http://compass-style.org">Compass</a>, <a href="http://coffeescript.org">CoffeeScript</a> and <a href="http://jade-lang.com">Jade</a> compilers in dev mode</li><li>Runs the local server</li><li>And watches for any updates to files ready to be recompiled</li></ul><p>You can find out more by reviewing <a href="docs/gruntfile.html" target="_self"><code>Gruntfile.coffee</code></a>.</p><h3 id="the-local-server">The local server</h3><p>This is a very handy little server that runs off <a href="http://expressjs.com">expressjs</a>. It&#39;ll serve the local files by default to <code>http://localhost:8000</code> and it&#39;ll also serve the raw non-compiled files as <code>text/plain</code> for convience of debugging.</p><p>You can find out more by reviewing <a href="docs/server.html" target="_self"><code>server.coffee</code></a>.</p><h3 id="the-web-crawler">The web crawler</h3><p>One of the biggest issues with creating single HTML page apps is trying to deal with SEO. This has been solved for you by a web crawler that uses <a href="http://phantomjs.org">PhantomJS</a>. It&#39;ll go to your homepage, find local site links and go off and cache <code>html</code> versions of those pages. This makes dealing with an SEO stratergy a lot easier.</p><p>You can find out more by reviewing <a href="docs/crawler.html" target="_self"><code>crawler.coffee</code></a>.</p></div>'),e.put("/assets/partial/cta-partial.html",'<div id="cta" class="row"><a href="https://github.com/ahmednuaman/radian">So what are you waiting for?Try it now &#9755;</a></div>'),e.put("/assets/partial/directive/menu-component-partial.html",'<div class="menu-component"><ul class="list-menu"><li data-ng-repeat="item in items"><a data-ng-href="{{item.href}}" data-ng-class="{&quot;selected&quot;: item.selected}" target="{{item.target}}">{{item.title}}</a></li></ul></div>'),e.put("/assets/partial/directive/stub-partial.html",'<div class="stub"></div>'),e.put("/assets/partial/error-partial.html",'<div id="error" data-ng-controller="errorController" class="text-centre"><h2>Sorry but a {{code}} error has occurred, and here\'s a picture of a sausage dog:</h2><img src="//i.imgur.com/nAdcBva.jpg" width="100%"></div>'),e.put("/assets/partial/faqs-partial.html",'<div id="faqs"><h1 id="faqs">FAQs</h1><h2 id="why-did-you-write-this-">Why did you write this?</h2><p>I think AngularJS is great. I&#39;ve used it on a number of small and large projects, but there was something that wasn&#39;t quite right about how to set up an app. I found that many developers chose different ways of doing the same thing, and this led to complexity and tight coupling. So I decided to create what <a href="https://github.com/marionettejs/backbone.marionette">Marionette is to Backbone</a> but for AngularJS.</p><h2 id="what-about-angular-seed-https-github-com-angular-angular-seed-">What about <a href="https://github.com/angular/angular-seed">angular-seed</a>?</h2><p>The angular-seed project is a good place for a developer new to AngularJS to start, but if you want to build a truly scalable and multi developer app then you need a more robust approach.</p><p>Radian provides a common style and set up to dealing with problems faced by teams when working on AngularJS apps. The beauty of using AMD to handle the loading of dependancies outside of the releams of AngularJS provides a higher level of abstraction and modulartiry to your code.</p><p>Radian is also pretty simple: all that&#39;s really happening is that you&#39;re splitting up your app into small, managable and decoupled components; this means you write more modulised code that helps you adopt the <a href="http://en.wikipedia.org/wiki/Dont_repeat_yourself">DRY</a> approach to your app.</p><h2 id="what-if-you-don-t-use-sass-jade-or-coffeescript-">What if you don&#39;t use SASS, Jade or CoffeeScript?</h2><p>Don&#39;t worry buddy, that&#39;s cool. You can simply grab all the JS, CSS and HTML by running the <code>grunt</code> command and dump all that precompiler nonsense.</p><p>The advantage (IMHO) to using precompiled languages is that they require a strict style and thus code is cleaner and more consistent; but that&#39;s a discussion for another day.</p><h2 id="what-about-tests-">What about tests?</h2><p>That&#39;s been covered too. Since the point of Radian is to highlight a style of app development I&#39;ve also written unit and client tests to make sure that all the code is pretty nice, open your terminal and run:</p><pre><code>npm test\n</code></pre><h2 id="are-there-any-docs-">Are there any docs?</h2><p>Yep, the source code is all commented and I&#39;ve used <a href="https://github.com/jashkenas/docco">Docco</a> to <a href="docs/app.html" target="_self">compile the docs</a>.</p><h2 id="who-are-you-">Who are you?</h2><p>I&#39;m <a href="http://ahmednuaman.com">Ahmed Nuaman</a>, I wrestle dachshunds and solve problems.</p></div>'),e.put("/assets/partial/footer-partial.html",'<div id="footer" data-ng-controller="footerController" class="row"><a href="http://ahmednuaman.com">Made with pain and blood by @ahmednuaman</a><ul class="list-menu"><li><a href="https://github.com/ahmednuaman/radian">Github Repo</a></li><li><a href="https://travis-ci.org/ahmednuaman/radian">Travis CI Status</a></li><li><a href="https://github.com/ahmednuaman/radian/blob/master/LICENSE">MIT License</a></li></ul></div>'),e.put("/assets/partial/header/header-menu-partial.html",'<div id="header-menu" data-ng-controller="headerMenuController"><div data-menu-component="data-menu-component" data-ng-model="menuItems"></div></div>'),e.put("/assets/partial/header/header-partial.html",'<div id="header" data-ng-controller="headerController" class="row"><div class="text-centre"><a id="logo" href="/"></a><h1 id="-radian-is-a-scalable-angularjs-framework-perfect-for-multi-developer-projects"><strong>Radian</strong> is a scalable AngularJS framework, perfect for multi developer projects</h1></div><div data-ng-include="menuPartial"></div></div>'),e.put("/assets/partial/home-partial.html",'<div id="home" data-ng-controller="homeController"><div class="row"><div class="col-3"><span class="icon icon-scale"></span><h2 id="code-that-scales">Code that scales</h2><p>Radian is the perfect set up for projects that need to scale fast. The AMD structure allows single developers to large teams to quickly and efficiently write and deploy great apps.</p></div><div class="col-3"><span class="icon icon-setup"></span><h2 id="rapid-set-up">Rapid set up</h2><p>Radian comes with everything out the box, that means there&#39;s all the minification and concatination tasks as well as a local server and even a <a href="http://phantomjs.org">PhantomJS</a> web crawler to deal with SEO woes.</p></div><div class="col-3"><span class="icon icon-lightweight"></span><h2 id="light-weight">Light weight</h2><p>Radian is a way of doing things, so there&#39;s nothing new to install and no additional dependancies to <a href="http://angularjs.org">AngularJS</a> and <a href="http://requirejs.org">RequireJS</a>.</p></div></div><div class="row"><div class="col-3"><span class="icon icon-tests"></span><h2 id="100-code-coverage">100% code coverage</h2><p>Testing is at the heart of Radian, so out the box it comes complete with all the unit tests you could want, <a href="test/report/coverage/html/Chrome%2031.0.1650%20(Mac%20OS%20X%2010.9.0)/index.html" target="_self">here&#39;s the proof</a>.</p></div><div class="col-3"><span class="icon icon-yeoman"></span><h2 id="generate-with-yeoman">Generate with Yeoman</h2><p>Radian is better with <a href="http://yeoman.io">Yeoman</a>, use it to set up your project and use the subgenerators to quickly create your app&#39;s code, with tests included.</p></div><div class="col-3"><span class="icon icon-customise"></span><h2 id="your-app-your-way">Your app, your way</h2><p>Radian is highly customisable; from the offset you can start with the barebones app or reverse engineer the example code.</p></div></div><div class="row"><h2 id="quick-start">Quick start</h2><p>The purpose of Radian is to help your team and you start building your app with minimal set up. There are two ways to create a Radian project:</p></div><div class="row"><h3 id="radian-using-yeoman">Radian using Yeoman</h3><p>Firstly you need to install <a href="http://yeoman.io">Yeoman</a>, then you can set up Radian by simply running:</p><pre><code>npm install -g generator-radian\nyo radian\n</code></pre><p>You can then make use of the built in subgenerators to create your project files, you have the choice of two types of generators, you use them by running:</p><pre><code>yo radian:TYPE &#39;NAME&#39;\n</code></pre><ul><li><strong>TYPE</strong>: is the generator you&#39;re wanting to use and...</li><li><strong>NAME</strong>: is the file/class/module name; this will be automatically slugified/camelized/classified for you, so it&#39;s better to write something like &#39;foo bar&#39;, rather than &#39;fooBar&#39;.</li></ul><h3 id="generating-coffeescript-files">Generating CoffeeScript files</h3><p>This generator will create a <strong>TYPE</strong>, say controller, in <code>assets/js/TYPE</code> and create a test spec in <code>test/unit/TYPE</code>; where <strong>TYPE</strong> is one of the following:</p><ul><li>controller</li><li>service</li><li>factory</li><li>directive</li><li>collection</li><li>vo</li></ul><p>Eg running:</p><pre><code>yo radian:controller &#39;foo bar&#39;\n</code></pre><p>Creates <code>assets/js/controller/foo-bar-controller.coffee</code> containing:</p><pre><code>define [\n  &#39;config&#39;\n  &#39;angular&#39;\n], (cfg, A) -&gt;\n  class FooBarController\n    @$inject = [\n      &#39;$scope&#39;\n    ]\n\n    constructor: (@$scope) -&gt;\n      @init()\n\n    init: () -&gt;\n\n  app = A.module cfg.ngApp\n  app.controller &#39;fooBarController&#39;, FooBarController\n</code></pre><p>And <code>test/unit/controller/foo-bar-controller-spec.coffee</code> containing:</p><pre><code>define [\n  &#39;config&#39;\n  &#39;angular&#39;\n  &#39;controller/foo-bar-controller&#39;\n], (cfg, A) -&gt;\n  describe &#39;Foo Bar controller&#39;, () -&gt;\n    $scope = null\n    createController = null\n\n    beforeEach module cfg.ngApp\n\n    beforeEach inject ($injector) -&gt;\n      $controller = $injector.get &#39;$controller&#39;\n      $rootScope = $injector.get &#39;$rootScope&#39;\n\n      $scope = $rootScope.$new()\n\n      createController = () -&gt;\n        $controller &#39;fooBarController&#39;,\n          $scope: $scope\n\n    it &#39;should load&#39;, () -&gt;\n      controller = createController()\n</code></pre><h3 id="generating-jade-and-sass-files">Generating Jade and SASS files</h3><p>This generator creates a Jade partial and an accompanying SASS partial, eg running:</p><pre><code>yo radian:partial &#39;my new view&#39;\n</code></pre><p>Creates <code>assets/css/partial/_my-new-view.sass</code> and <code>assets/partial/my-new-view-partial.jade</code>, and finally updates <code>assets/css/_partials.sass</code> to include the newly created SASS file.</p><h3 id="radian-without-using-yeoman">Radian without using Yeoman</h3><p>All you need to have installed is <a href="http://git-scm.org">git</a>, <a href="http://nodejs.org">NodeJS</a> and the following NodeJS <code>cli</code> tools:</p><ul><li><a href="http://gruntjs.com">GruntJS</a></li><li><a href="http://bower.io">Bower</a></li><li><a href="http://karma-runner.github.io">Karma</a></li></ul><p>To start using Radian simply download the code from <a href="https://github.com/ahmednuaman/radian">github.com</a> and set it up:</p><pre><code>npm install\ngrunt install\ngrunt\n</code></pre></div><div class="row"><h3 id="and-then-">And then...</h3><p>Running <code>grunt</code> will generate all the JS, CSS and HTML, and it&#39;ll also start the local server, so point your browser to <a href="http://localhost:8000"><a href="http://localhost:8000">http://localhost:8000</a></a> and you&#39;re laughing.</p></div></div>')},r.$inject=["$templateCache"],n=t.module(e.ngApp),n.run(r)})}.call(this),function(){define("controller/error-controller",["config","angular"],function(e,t){var n,r;return n=function(){function e(e,t){this.$scope=e,this.$routeParams=t,this.init()}return e.$inject=["$scope","$routeParams"],e.prototype.init=function(){return this.$scope.code=this.$routeParams.code||"404"},e}(),r=t.module(e.ngApp),r.controller("errorController",n)})}.call(this),function(){define("controller/home-controller",["config","angular"],function(e,t){var n,r;return n=function(){function e(e){this.$scope=e,this.init()}return e.$inject=["$scope"],e.prototype.init=function(){},e}(),r=t.module(e.ngApp),r.controller("homeController",n)})}.call(this),function(){define("routes",["config","angular","controller/error-controller","controller/home-controller"],function(e,t){var n,r;return r=function(t,n){return t.when("/code",{templateUrl:e.path.partial+"code-partial.html"}).when("/error/:code",{templateUrl:e.path.partial+"error-partial.html"}).when("/error",{templateUrl:e.path.partial+"error-partial.html"}).when("/faqs",{templateUrl:e.path.partial+"faqs-partial.html"}).when("/",{templateUrl:e.path.partial+"home-partial.html"}),t.otherwise({redirectTo:"/"}),n.html5Mode(!0)},r.$inject=["$routeProvider","$locationProvider"],n=t.module(e.ngApp),n.config(r)})}.call(this),function(){define("directive/menu-component-directive",["config","angular"],function(e,t){var n,r;return r=function(){return{templateUrl:e.path.partial+"directive/menu-component-partial.html",restrict:"A",replace:!0,scope:{items:"=ngModel"}}},n=t.module(e.ngApp),n.directive("menuComponent",r)})}.call(this),function(){define("vo/menu-item-vo",["lodash"],function(e){return function(t){return e.assign(t,{selected:!1,target:t.target})}})}.call(this),function(){define("collection/menu-items-collection",["lodash","vo/menu-item-vo"],function(e,t){return function(n,r){var i;return i=e.map(r,t),n.resolve(i)}})}.call(this),function(){define("factory/page-title-factory",["config","angular"],function(e,t){var n,r;return r=function(e){var t,n,r;return n="pageTitleChange",t=function(t){return e.$emit(n,t)},r={setTitle:function(e){return t(e)},addListener:function(t){return e.$on(n,t)}}},r.$inject=["$rootScope"],n=t.module(e.ngApp),n.factory("pageTitleFactory",r)})}.call(this),function(){define("factory/menu-factory",["config","angular","lodash","collection/menu-items-collection","factory/page-title-factory"],function(e,t,n,r){var i,s;return s=function(e,n,i,s){var o,u;return u=function(e,t){return o.collection=t,o.digest(),e.resolve()},i.$on("$locationChangeSuccess",function(e){return o.digest()}),o={collection:null,selectedItem:null,set:function(e,i){var s,o;return s=n.defer(),o=t.bind(this,u,e),r(s,i),s.promise.then(o)},get:function(){return o.collection},digest:function(){return o.setSelectedItemByHref(e.path())},setSelectedItemByHref:function(e){return o.selectedItem&&(o.selectedItem.selected=!1),t.forEach(o.collection,function(t){e==="/"?t.selected=t.href===e:t.selected=!!~t.href.indexOf(e);if(t.selected)return o.selectedItem=t,s.setTitle(t.title)})}}},s.$inject=["$location","$q","$rootScope","pageTitleFactory"],i=t.module(e.ngApp),i.factory("menuFactory",s)})}.call(this),function(){define("factory/page-error-factory",["config","angular","lodash"],function(e,t,n){var r,i;return i=function(e){var t,r;return r=function(t){return e.path("/error/"+t)},t={showError:function(e){return r(e)}},n.forEach(["404","500"],function(e){return t["show"+e]=function(){return t.showError(e)}}),t},i.$inject=["$location"],r=t.module(e.ngApp),r.factory("pageErrorFactory",i)})}.call(this),function(){define("service/menu-service",["config","angular","factory/menu-factory"],function(e,t){var n,r;return n=function(){function e(e,t,n){this.$q=e,this.$resource=t,this.menuFactory=n,this.init()}return e.$inject=["$q","$resource","menuFactory"],e.prototype.init=function(){return this.menu=this.$resource("/data/menu.json")},e.prototype.get=function(){var e,n,r;return e=this.$q.defer(),r=t.bind(this,this.handleSuccess,e),n=t.bind(this,this.handleFailure,e),this.menu.get().$promise.then(r,n),e.promise},e.prototype.handleSuccess=function(e,t){return this.menuFactory.set(e,t.items)},e.prototype.handleFailure=function(e){return e.reject()},e}(),r=t.module(e.ngApp),r.service("menuService",n)})}.call(this),function(){define("controller/header/header-menu-controller",["config","angular","directive/menu-component-directive","factory/menu-factory","factory/page-error-factory","service/menu-service"],function(e,t){var n,r;return n=function(){function e(e,t,n,r){this.$scope=e,this.menuFactory=t,this.menuService=n,this.pageErrorFactory=r,this.init()}return e.$inject=["$scope","menuFactory","menuService","pageErrorFactory"],e.prototype.init=function(){return this.loadMenu()},e.prototype.loadMenu=function(){var e,n;return n=t.bind(this,this.handleLoadMenuSuccess),e=t.bind(this,this.handleLoadMenuFailure),this.menuService.get().then(n,e)},e.prototype.handleLoadMenuSuccess=function(){return this.$scope.menuItems=this.menuFactory.get()},e.prototype.handleLoadMenuFailure=function(){return this.pageErrorFactory.show500()},e}(),r=t.module(e.ngApp),r.controller("headerMenuController",n)})}.call(this),function(){define("controller/header/header-controller",["config","angular","controller/header/header-menu-controller"],function(e,t){var n,r;return n=function(){function t(e){this.$scope=e,this.init()}return t.$inject=["$scope"],t.prototype.init=function(){return this.addPartials()},t.prototype.addPartials=function(){return this.$scope.menuPartial=e.path.partial+"header/header-menu-partial.html"},t}(),r=t.module(e.ngApp),r.controller("headerController",n)})}.call(this),function(){define("controller/footer-controller",["config","angular"],function(e,t){var n,r;return n=function(){function e(e){this.$scope=e,this.init()}return e.$inject=["$scope"],e.prototype.init=function(){},e}(),r=t.module(e.ngApp),r.controller("footerController",n)})}.call(this),function(){define("controller/app-controller",["config","angular","partials","routes","controller/header/header-controller","controller/footer-controller","factory/page-title-factory"],function(e,t){var n,r;return n=function(){function n(e,t){this.$scope=e,this.pageTitleFactory=t,this.init()}return n.$inject=["$scope","pageTitleFactory"],n.prototype.init=function(){return this.addListeners(),this.addPartials()},n.prototype.addListeners=function(){return this.pageTitleFactory.addListener(t.bind(this,this.handlePageTitleChange))},n.prototype.addPartials=function(){return this.$scope.ctaPartial=e.path.partial+"cta-partial.html",this.$scope.footerPartial=e.path.partial+"footer-partial.html",this.$scope.headerPartial=e.path.partial+"header/header-partial.html"},n.prototype.handlePageTitleChange=function(e,t){return this.$scope.pageTitle="Radian ~ A scalable AngularJS framework ~ "+t},n}(),r=t.module(e.ngApp),r.controller("appController",n)})}.call(this);