KR.Views.Header = Backbone.View.extend({
  events: {
    "click form#submit" : "goSearch"
  },
  
  template: JST["root/header"],

  render: function () {
    var renderedContent = this.template({
      role: KR.currentRole
    });
    this.$el.html(renderedContent);
    return this;
  },  

  goSearch: function (event) {
    event.preventDefault();
    var club = $('#searchbox').serializeJSON();
    
  },
  
});