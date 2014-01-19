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
    "clubs/:id" : "clubShow",
    "search/query" : "searchResults"
  },

  root: function () {
    var view = new KR.Views.Root();
    this._swapView(view);
  },

  booksIndex: function () {
    var that = this;

    KR.books.fetch({
      success: function () {
        var view = new KR.Views.BooksIndex({
          collection: KR.books
        });
        that._swapView(view);      
      }
    })

  },

  bookShow: function(bookId) {
    var that = this
    var book = this._getBook(bookId, function (book) {
      var view = new KR.Views.BookShow({
        model: book
      });
      that._swapView(view);
    });
  },

  _getBook: function (id, callback) {
    var book = KR.books.get(id);
    if (!book) {
      book = new KR.Models.Book({ id: id });
      book.collection = KR.books;
      book.fetch({
        success: function () {
          KR.books.add(book);
          callback(book);
        }
      });
    } else {
      callback(book);
    }
  },

  userShow: function(userId) {
    var that = this;
    var user = this._getUser(userId, function (user) {
      var view = new KR.Views.UserShow({
        model: user
      });
      that._swapView(view);   
    });   
  },

  _getUser: function (id, callback) {
    var user = new KR.Models.User({ id: id });
    user.fetch({
      success: function (user) {
        callback(user);
      }
    });
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
        success: function (club) {
          KR.clubs.add(club);
          callback(club);
        }
      });
    } else {
      callback(club);
    }
  },

  searchResults: function () {
    var results = new KR.Collections.SearchResults();
    console.log(results);
    results.fetch({
      success: function () {
        var view = new KR.Views.SearchResults({
          collection: results,
        });
        this._swapView(view);
      }
    });
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  }

});