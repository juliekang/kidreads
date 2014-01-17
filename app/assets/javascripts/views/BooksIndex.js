KR.Views.BooksIndex = Backbone.View.extend({
  events: {
  },

  template: JST["books/index"],

  initialize: function () {
    this.listenTo(this.collection, "add remove reset", this.render)
  },

  render: function () {
    var renderedContent = this.template();
    var that = this;

    this.$el.html(renderedContent);

    this.collection.each(function (book) {
      var view = new KR.Views.BookListItem({
        model: book
      });
      that.$('#book_list').append(view.render().$el);
    });

    return this;
  }
});