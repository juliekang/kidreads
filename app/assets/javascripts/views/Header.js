KR.Views.Header = Backbone.View.extend({
  events: {
    "submit form#searchbox" : "goSearch",
    "click button#my-profile-button" : "showProfile"
  },
  
  template: JST["root/header"],

  render: function () {
    var renderedContent = this.template({
      role: KR.currentRole
    });
    this.$el.html(renderedContent);
    return this;
  },  

  showProfile: function (event) {
    Backbone.history.navigate('users/' + KR.currentUserID, {trigger: true}); 
  },

  goSearch: function (event) {
    event.preventDefault();
    var formData = $('#searchbox').serializeJSON();
    var query_string = 'search/results/' + formData['q'];

    if(formData['filter']) {
      query_string = query_string + '/' + formData['filter'];
    }
    
    Backbone.history.navigate(query_string, {trigger: true});
  },
  
});