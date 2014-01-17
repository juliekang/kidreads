KR.Views.Header = Backbone.View.extend({
  events: {},
  
  template: JST["root/header"],

  render: function () {
    var renderedContent = this.template({
      role: KR.currentRole
    });
    this.$el.html(renderedContent);
    return this;
  }
  
});