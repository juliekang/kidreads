KR.Views.Footer = Backbone.View.extend({
  events: {
    "click button#new-club-submit" : "submit",
    "click button#random-book-button" : "randomBook"
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
  },

  randomBook: function (event) {
    var bookId = Math.floor(Math.random() * 19000) + 8;
    Backbone.history.navigate('books/' + bookId, {trigger: true}); 
  }
  
});