KR.Views.ClubShow = Backbone.View.extend({
  events: {},
  
  template: JST["clubs/show"],

  render: function () {
    var renderedContent = this.template({
      club: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
  
});