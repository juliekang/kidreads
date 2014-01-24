KR.Views.BooksIndex = Backbone.View.extend({
  events: {
  },

  template: JST["books/index"],

  initialize: function () {
    this.listenTo(this.collection, "add remove reset", this.render);
  },

  render: function () {
    var renderedContent = this.template();
    var that = this;

    this.$el.html(renderedContent);

    if (this.collection.length == 0) {
      var view = new KR.Views.NewUserView();
      this.$el.prepend(view.render().$el);
    } else {
      this.collection.each(function (book) {
        var view = new KR.Views.BookListItem({
          model: book
        });

        var status = book.book_status().get('status');

        if(status == 'current') {
          that.$('#current').append(view.render().$el);
        } else if(status == 'read') {
          that.$('#read').append(view.render().$el);
        } else if(status == 'wish') {
          that.$('#wish').append(view.render().$el);
        } else {
          that.$('#randoms').append(view.render().$el);
        }
      });
    }
    return this;
  }
});