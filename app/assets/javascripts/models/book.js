KR.Models.Book = Backbone.Model.extend({
  url: function () {
    return "/kr/books/" + this.id;
  },

  parse: function (jsonResp) {
    if (jsonResp.status) {
      this.status().set(jsonResp.status);
      delete jsonResp.status;
    }

    if (jsonResp.current_user_review) {
      this.current_user_review().set(jsonResp.current_user_review);
      delete jsonResp.current_user_review;      
    }
    return jsonResp;
  },

  status: function () {
    if (!this._status) {
      this._status = new KR.Models.BookStatus(this);
    }

    return this._status;
  },

  current_user_review: function () {
    if (!this._status) {
      this._status = new KR.Models.Review(this);
    }

    return this._status;
  }

})