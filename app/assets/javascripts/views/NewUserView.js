KR.Views.NewUserView = Backbone.View.extend({
  events: {
    "submit form#newUserSearchbox" : "goSearch",
  },

  template: JST["root/newUser"],

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  goSearch: function (event) {
    event.preventDefault();
    var formData = $('#newUserSearchbox').serializeJSON();
    var query_string = 'search/results/' + formData['q'];

    if(formData['filter']) {
      query_string = query_string + '/' + formData['filter'];
    }
    
    Backbone.history.navigate(query_string, {trigger: true});
  },
});