KR.Views.Header = Backbone.View.extend({
  events: {
    "submit form#searchbox" : "goSearch",
    "click button#new-club-submit" : "submit",
    "click button#random-book-button" : "randomBook"
  },
  
  template: JST["root/header"],

  initialize: function () {
    this.listenTo(KR.clubs, "add remove reset", this.render)
    this.listenTo(KR.books, "all", this.render)
  },

  render: function () {
    var renderedContent = this.template({
      role: KR.currentRole
    });
    this.$el.html(renderedContent);
    return this;
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

  submit: function (event) {
    event.preventDefault();
    var club = $('#new-club-form').serializeJSON();

    club = KR.clubs.create(club, { 
      success: function (club) {
        KR.activityStreams.create({
          url: "/#clubs/" + club.id,
          activity_verb: 'created',
          activity_object: 'a club:',
          club_name: club.get('club_name')   
        });
      }
    });
    $("#new-club-modal").modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
  },

  randomBook: function (event) {
    var bookId = Math.floor(Math.random() * 1000);
    Backbone.history.navigate('books/' + bookId, {trigger: true}); 
  }  
});