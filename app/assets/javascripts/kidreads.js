window.KR = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    KR.books = new KR.Collections.Books();
    KR.clubs = new KR.Collections.Clubs();
    var booksFetch = KR.books.fetch();
    var clubsFetch = KR.clubs.fetch();


    var headerView = new KR.Views.Header();
    $('#header').html(headerView.render().$el);

    var footerView = new KR.Views.Footer({ role: KR.currentRole });
    $('#footer').html(footerView.render().$el);

    $.when(
      booksFetch, clubsFetch
    ).then(function () {
        new KR.Routers.Router({ $rootEl: $('#kr_pane') });
        Backbone.history.start();      
    });
  }
};
