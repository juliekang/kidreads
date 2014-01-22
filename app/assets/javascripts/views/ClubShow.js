KR.Views.ClubShow = Backbone.View.extend({
  events: {},
  
  template: JST["clubs/show"],

  render: function () {
    var renderedContent = this.template({
      club: this.model
    });
    
    this.$el.html(renderedContent);

    console.log(this.model.club_streams())
    
    var view = new KR.Views.ActivityStreamsIndex({
      collection: this.model.club_streams()
    });
    this.$("#club_streams").html(view.render().$el);

    return this;
  }
  
});