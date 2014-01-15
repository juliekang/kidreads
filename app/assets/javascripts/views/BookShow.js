KR.Views.BookShow = Backbone.View.extend({
  events: {},
  template: JST["books/show"],
  render: function () {
    var renderedContent = this.template({
      book: view.model
    });
    view.$el.html(renderedContent);
    return view;
  }
  
})