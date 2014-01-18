KR.Views.Root = Backbone.View.extend({
  events: {
  },

  template: JST["root/main"],

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);

    return this;
  }
});