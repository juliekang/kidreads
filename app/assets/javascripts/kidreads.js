window.KR = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    KR.users = new KR.Collections.Users();
    KR.users.fetch({
      success: function() {
        new KR.Routers.Router({ $rootEl: '#kr_pane' });
        Backbone.history.start();
      }
    });

    KR.books = new KR.Collections.Books();
    KR.books.fetch();

  }
};

$(document).ready(function() {
  KR.initialize();
});

