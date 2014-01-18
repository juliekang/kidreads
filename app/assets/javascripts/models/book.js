KR.Models.Book = Backbone.Model.extend({
  url: function () {
    return "/kr/books/" + this.id;
  },

  parse: function (data) {
    var users = data.users;
    data.users = new KR.Collections.Users(users);

    var reviews = data.reviews;
    data.reviews = new KR.Collections.Reviews(reviews);

    var book_statuses = data.book_statuses;
    data.book_statuses = new KR.Collections.BookStatuses(book_statuses);
    
    return data;
  },

  toJSON: function () {
    var data = _.clone(this.attributes);
    return data;
  }
})