KR.Views.BooksIndex = Backbone.View.extend({
  events: {},

  template: JST["books/index"],

  initialize: function () {
    this.listenTo(this.collection, "add remove reset", this.render)
  },

  render: function () {
    var renderedContent = this.template({
      books: this.collection
    });
    this.$el.html(renderedContent);

    return this;
  }
});