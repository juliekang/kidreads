KR.Views.UserShow = Backbone.View.extend({
  events: {},
  
  template: JST["users/show"],

  render: function () {
    var renderedContent = this.template({
      user: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
  
});