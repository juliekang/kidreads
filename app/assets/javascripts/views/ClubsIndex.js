KR.Views.ClubsIndex = Backbone.View.extend({
  events: {
  },

  template: JST["clubs/index"],

  initialize: function () {
    this.listenTo(this.collection, "add remove reset", this.render)
  },

  render: function () {
    var renderedContent = this.template();
    var that = this;

    this.$el.html(renderedContent);

    this.collection.each(function (club) {
      var view = new KR.Views.ClubListItem({
        model: club
      });
      that.$('#club_list').append(view.render().$el);
    });

    return this;
  }
});