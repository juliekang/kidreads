KR.Views.BookShow = Backbone.View.extend({
  events: {
    "change #list-selector" : "listSelected"
  },
  
  template: JST["books/show"],

  render: function () {
    var renderedContent = this.template({
      book: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },

  listSelected: function (event) {
    event.preventDefault();
    var statusVal = $(event.target).val();

    var status = new KR.Models.BookStatus({
      book_id: this.model.id, 
      status: statusVal
    });
    status.save();
  }
  
});