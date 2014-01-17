KR.Views.ClubNew = Backbone.View.extend({
  events: {
    "click new-club-submit" : "submit"
  },
  
  template: JST["clubs/new"],

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    $('#new-club-modal-body').html("testing");

    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var club = $('#new-club-form').serializeJSON();
    debugger
    KR.clubs.create(club);
  }
  
});