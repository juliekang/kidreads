KR.Views.Footer = Backbone.View.extend({
  events: {},
  
  template: JST["root/footer"],

  initialize: function (options) {
    this.role = options.role;
  },

  render: function () {
    var renderedContent = this.template({
      role: this.role
    });
    this.$el.html(renderedContent);
    return this;
  }
  
});