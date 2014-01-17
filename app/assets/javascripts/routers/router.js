KR.Routers.Router = Backbone.Router.extend({
  initialize: function(object) {
    this.$rootEl = object.$rootEl;
  },

  routes: {
    "" : "root",
    "books" : "booksIndex",
    "books/:id" : "bookShow",
    "users/:id" : "userShow",
    "clubs" : "clubsIndex",
    "clubs/:id" : "clubShow"
  },

  root: function () {
    var view = new KR.Views.Root();
    this._swapView(view);
  },

  booksIndex: function () {
    var view = new KR.Views.BooksIndex({
      collection: KR.books
    });
    this._swapView(view);
  },

  bookShow: function(bookId) {
    var book = KR.books.get(bookId);
    var view = new KR.Views.BookShow({
      model: book
    });
    this._swapView(view);
  },

  userShow: function(userId) {
    var user = KR.users.get(userId);
    var view = new KR.Views.UserShow({
      model: user
    });
    this._swapView(view);
  },

  clubsIndex: function () {
    var view = new KR.Views.ClubsIndex({
      collection: KR.clubs
    });
    this._swapView(view);
  },
 
  clubShow: function(clubId) {
    var that = this;
    var club = this._getClub(clubId, function (club) {
      var view = new KR.Views.ClubShow({
        model: club
      });
      that._swapView(view);   
    });
  },

  _getClub: function (id, callback) {
    var club = KR.clubs.get(id);
    if (!club) {
      club = new KR.Models.Club({ id: id });
      club.collection = KR.clubs;
      club.fetch({
        success: function () {
          KR.clubs.add(club);
          callback(club);
        }
      });
    } else {
      callback(club);
    }
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  }

});