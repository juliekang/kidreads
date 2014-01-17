KR.Views.ClubShow = Backbone.View.extend({
  events: {},
  
  template: JST["clubs/show"],

  render: function () {
    var renderedContent = this.template({
      club: this.model
    });
    this.$el.html(renderedContent);
    //this._renderMembers();
    return this;
  },

  // _renderMembers: function () {
  //   var view = new KR.Views.MembersIndex({
  //     collection: this.model.get('members')
  //   });
  //   this.$('members').html(view.render().$el);
  // }
  
});