KR.Views.SplashPage = Backbone.View.extend({
  events: {
  },

  template: JST["root/splash"],

  render: function () {
    var renderedContent = this.template({
      books: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }
});