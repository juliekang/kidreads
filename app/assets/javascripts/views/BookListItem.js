KR.Views.BookListItem = Backbone.View.extend({
  events: {
    "click a" : "insertBookShow"
  },
  tagName: 'li',  
  template: JST["books/listItem"],

  render: function () {
    var renderedContent = this.template({
      book: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },

  insertBookShow: function(event) {
    event.preventDefault();
    var that = this;

    var view = new KR.Views.BookShow({
      model: this.model
    });

    this.$('#book_data').html(view.render().$el);
    return this;
  }
  
});