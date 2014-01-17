KR.Views.Footer = Backbone.View.extend({
  events: {
    "click button#new-club-submit" : "submit",
  },
  
  template: JST["root/footer"],

  initialize: function (options) {
    this.role = options.role;
    this.listenTo(KR.clubs, "add remove reset", this.render)
  },

  render: function () {
    var renderedContent = this.template({
      role: this.role
    });
    this.$el.html(renderedContent);
    //this.$el.$('#new-club-modal-body').html(new KR.Views.ClubNew({ model: KR.currentUser }).render().$el);

    return this;
  },

  submit: function (event) {
    //event.preventDefault();
    var club = $('#new-club-form').serializeJSON();
    KR.clubs.create(club, { 
      success: function () {
        $("#new-club-modal").modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
      }
    });
  }
  
});