KR.Views.ActivityStreamsIndex = Backbone.View.extend({
  events: {
  },

  template: JST["activityStreams/index"],

  initialize: function () {
    this.listenTo(this.collection, "add remove reset", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      streams: this.collection
    });
    var that = this;

    this.$el.html(renderedContent);

    return this;
  }
});