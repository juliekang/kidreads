KR.Views.SearchResults = Backbone.View.extend({
  events: {
  },

  template: JST["search/results"],

  initialize: function () {
    //this.model.on("change:searchResults", this.render, this)
  },

  render: function () {
    console.log("inside render");
    var renderedContent = this.template();
    var that = this;

    this.$el.html(renderedContent);

    this.collection.each(function (book) {
      var view = new KR.Views.BookListItem({
        model: book
      });
      that.$('#result_list').append(view.render().$el);
    });

    return this;
  }
});