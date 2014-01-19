KR.Views.UserShow = Backbone.View.extend({
  events: {
    "click a#booksLink" : "toggleBooksIndex",
    "click a#clubsLink" : "toggleClubsIndex"
  },
  
  template: JST["users/show"],

  render: function () {
    var renderedContent = this.template({
      user: this.model,
      age: this._calcAge(this.model.birthdate)
    });
    this.$el.html(renderedContent);
    return this;
  },

  toggleBooksIndex: function(event) {
    event.preventDefault();
    var that = this;

    if($('#books').html().length > 0) {
      $('#books').html('');
    } else {
       var view = new KR.Views.BooksIndex({
        collection: new KR.Collections.Books(that.model.get('books'))
      });

      $('#books').html(view.render().$el);     
    }

    return this;
  },

  toggleClubsIndex: function(event) {
    event.preventDefault();
    var that = this;

    if($('#clubs').html().length > 0) {
      $('#clubs').html('');
    } else {
       var view = new KR.Views.ClubsIndex({
        collection: new KR.Collections.Clubs(that.model.get('clubs'))
      });

      $('#clubs').html(view.render().$el);     
    }

    return this;
  },

  _calcAge: function (birthday) {
    return ~~((Date.now() - birthday) / (31557600000));
  }
});