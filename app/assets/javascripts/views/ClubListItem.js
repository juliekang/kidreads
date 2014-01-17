KR.Views.ClubListItem = Backbone.View.extend({
  events: {
  },
  tagName: 'li',  
  template: JST["clubs/listItem"],

  render: function () {
    var renderedContent = this.template({
      club: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
  
});