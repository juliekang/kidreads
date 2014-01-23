window.KR = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function() {
    KR.books   = new KR.Collections.Books();
    KR.clubs   = new KR.Collections.Clubs();
    KR.reviews = new KR.Collections.Reviews();
    KR.kids    = new KR.Collections.Users();
    KR.activityStreams = new KR.Collections.ActivityStreams();

    var booksFetch   = KR.books.fetch();
    var clubsFetch   = KR.clubs.fetch();
    var reviewsFetch = KR.reviews.fetch();
    var kidsFetch    = KR.kids.fetch();
    var activityStreamsFetch = KR.activityStreams.fetch();

    var headerView = new KR.Views.Header();
    $('#header').html(headerView.render().$el);

    $.when(
      booksFetch, clubsFetch, reviewsFetch, kidsFetch, activityStreamsFetch
    ).then(function () {
        new KR.Routers.Router({ $rootEl: $('#kr_pane') });
        Backbone.history.start();      
    });
  }
};

jQuery.fn.raty.defaults.path = 'assets'; 
