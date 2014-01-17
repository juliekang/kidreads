KR.Views.BookListItem = Backbone.View.extend({
  events: {
    "click a" : "toggleBookShow"
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

  toggleBookShow: function(event) {
    event.preventDefault();
    var that = this;

    if(this.$('#book_data').html().length > 0) {
      this.$('#book_data').html('');
    } else {
       var view = new KR.Views.BookShow({
        model: this.model
      });

      this.$('#book_data').html(view.render().$el);     
    }

    return this;
  }
  
});