KR.Collections.Reviews = Backbone.Collection.extend({
  url: "/kr/reviews",
  model: KR.Models.Review,

  _getReview: function (userId, bookId) {
    console.log("inside _getReview");
    var record = this.findWhere({user_id: userId, book_id: bookId});
    return record;
  }
});