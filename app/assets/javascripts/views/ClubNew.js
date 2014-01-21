KR.Views.ClubNew = Backbone.View.extend({
  events: {
  },
  
  template: JST["clubs/new"],

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    $('#new-club-modal-body').html("testing");

    return this;
  }
  
});