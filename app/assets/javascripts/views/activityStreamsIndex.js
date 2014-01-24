KR.Views.ActivityStreamsIndex = Backbone.View.extend({
  events: {
  },

  template: JST["activityStreams/index"],

  initialize: function () {
    this.listenTo(this.collection, "all", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      streams: this.collection
    });
    this.$el.html(renderedContent);

    return this;
  }
});