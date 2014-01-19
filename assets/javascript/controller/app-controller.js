define([
  'config',
  'angular',
  'controller/radian-controller',
  'partials',
  'routes',
  'controller/header/header-controller',
  'controller/footer-controller',
  'factory/page-loader-factory',
  'factory/page-title-factory'
], function(cfg, A, RC) {
  RC('AppController', [
    '$scope',
    'pageLoaderFactory',
    'pageTitleFactory'
  ], {
    init: function() {
      this.addListeners();
      this.addPartials();
      this.addScopeMethods();
    },

    addListeners: function() {
      this.pageLoaderFactory.addListener(A.bind(this, this.handlePageLoaderChange));
      this.pageTitleFactory.addListener(A.bind(this, this.handlePageTitleChange));
    },

    addPartials: function() {
      this.$scope.ctaPartial = cfg.path.partial + 'cta-partial.html';
      this.$scope.footerPartial = cfg.path.partial + 'footer-partial.html';
      this.$scope.headerPartial = cfg.path.partial + 'header/header-partial.html';
    },

    addScopeMethods: function() {
      this.$scope.handleViewLoaded = A.bind(this, this.handleViewLoaded);
    },

    handlePageTitleChange: function(event, title) {
      this.$scope.pageTitle = 'Radian ~ A scalable AngularJS framework ~ ' + title;
    },

    handlePageLoaderChange: function(event, show) {
      this.$scope.hideLoader = !show;
    },

    handleViewLoaded: function() {
      this.pageLoaderFactory.hide();
    }
  });
});