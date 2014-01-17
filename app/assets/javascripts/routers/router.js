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
      collection: clubs
    });
    this._swapView(view);
  },
 
  clubShow: function(clubId) {
    var club = KR.clubs.get(clubId);
    var view = new KR.Views.ClubShow({
      model: club
    });
    this._swapView(view);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  }

});