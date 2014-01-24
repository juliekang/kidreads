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

    if (this.collection.length == 0) {
      var view = new KR.Views.NewUserView();
      this.$el.append(view.render().$el);
    }
    return this;
  }
});