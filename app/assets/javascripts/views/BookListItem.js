KR.Views.BookListItem = Backbone.View.extend({
  events: {
  },
  tagName: 'li',  
  template: JST["books/listItem"],

  render: function () {
    var renderedContent = this.template({
      book: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
  
});