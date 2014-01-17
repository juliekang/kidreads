window.KR = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    KR.users = new KR.Collections.Users();
    KR.users.fetch({
      success: function() {
        new KR.Routers.Router({ $rootEl: $('#kr_pane') });
        Backbone.history.start();
      }
    });

    KR.books = new KR.Collections.Books();
    KR.books.fetch();

    var headerView = new KR.Views.Header();
    $('#header').html(headerView.render().$el);

    var footerView = new KR.Views.Footer({ role: KR.currentRole });
    $('#footer').html(footerView.render().$el);
  }
};

// $(document).ready(function() {
//   KR.initialize();
// });

