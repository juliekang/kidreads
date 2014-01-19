KR.Views.Header = Backbone.View.extend({
  events: {
    "submit form#searchbox" : "goSearch"
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
    console.log("goSearch triggered");
    //event.preventDefault();
    // var formData = $('#searchbox').serializeJSON();

    // var results = new KR.Collections.SearchResults();
    // results.fetch({
    //   success: function () {    
    //     var renderedContent = this.template({
    //       results: results
    //     });
    //     this.$el.html(renderedContent);
    //     return this;
    //   }
    // })

  },
  
});