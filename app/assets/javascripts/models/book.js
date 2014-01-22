KR.Models.Book = Backbone.Model.extend({
  url: function () {
    return "/kr/books/" + this.id;
  },

  parse: function (jsonResp) {
    if (jsonResp.book_status) {
      this.book_status().set(jsonResp.book_status);
      delete jsonResp.book_status;
    }
    if(jsonResp.reviews) {
      this.reviews().set(jsonResp.reviews);
      delete jsonResp.reviews;
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
      var review = this.reviews().findWhere({user_id: KR.currentUserID });
      this._current_user_review = review;
    }

    return this._current_user_review;
  },

  reviews: function () {
    if(!this._reviews) {
      this._reviews = new KR.Collections.Reviews([]);
    }
    return this._reviews;
  }
})