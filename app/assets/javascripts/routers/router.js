KR.Routers.Router = Backbone.Router.extend({
  initialize: function(object) {
    this.$rootEl = object.$rootEl;
  },

  routes: {
    "books" : "booksIndex",
    "books/:id" : "bookShow",
    "users/:id" : "userShow"
  },

  booksIndex: function () {
    var view = new KR.Views.BooksIndex({
      collection: KR.books
    });
    this._swapView(view);
  },

  bookListItem: function (bookId) {
    var book = KR.books.get(bookId);
    var view = new KR.Views.BookListItem({
      model: book
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

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    $("#kr_pane").html(this._currentView.render().$el);
  }

});