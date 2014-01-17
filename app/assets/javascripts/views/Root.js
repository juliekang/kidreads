KR.Views.Root = Backbone.View.extend({
  events: {
  },

  template: JST["root/main"],

  initialize: function () {
    //this.listenTo(this.collection, "add remove reset", this.render)
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);

    return this;
  }
});