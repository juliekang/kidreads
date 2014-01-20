KR.Models.Book = Backbone.Model.extend({
  url: function () {
    return "/kr/books/" + this.id;
  },

  parse: function (jsonResp) {
    if (jsonResp.book_status) {
      this.book_status().set(jsonResp.book_status);
      delete jsonResp.book_status;
    }

    if (jsonResp.current_user_review) {
      this.current_user_review().set(jsonResp.current_user_review);
      delete jsonResp.current_user_review;
    }
    return jsonResp;
  },

  book_status: function () {
    if (!this._book_status) {
      this._book_status = new KR.Models.BookStatus();
    }

    return this._book_status;
  },

  current_user_review: function () {
    if (!this._current_user_review) {
      this._current_user_review = new KR.Models.Review();
    }

    return this._current_user_review;
  }

})