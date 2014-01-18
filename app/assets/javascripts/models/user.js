KR.Models.User = Backbone.Model.extend({
  urlRoot: '/users',

  parse: function (data) {
    var books = data.books;
    data.books = new KR.Collections.Books(books);
    return data;
  },

  toJSON: function () {
    var data = _.clone(this.attributes);
    return data;
  }
});