KR.Models.User = Backbone.Model.extend({
  urlRoot: '/users',

  parse: function (jsonResp) {
    if (jsonResp.books) {
      this.books().set(jsonResp.books, { parse: true });
      delete jsonResp.books;
    }

    return jsonResp;
  },

  books: function () {
    if(!this._books) {
      this._books = new KR.Collections.Books([]);
    }
    return this._books;
  }
});