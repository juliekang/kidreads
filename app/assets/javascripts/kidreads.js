window.KR = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    KR.books = new KR.Collections.Books();
    KR.books.fetch({
      success: function() {
        new KR.Routers.Router({ $rootEl: '#kr_pane' });
        Backbone.history.start();
      }
    });
  }
};

$(document).ready(function() {
  KR.initialize();
});

