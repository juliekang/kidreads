KR.Views.BookShow = Backbone.View.extend({
  events: {
    "change #list-selector" : "listSelected",
  },
  
  template: JST["books/show"],

  initialize: function () {
    this.listenTo(this.model, "add remove reset", this.render);
    this.listenTo(KR.reviews, "add reset change", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      book: this.model
    });

    this.$el.html(renderedContent);

    this._setUpRaty();

    var book_status = this.model.book_status().get('status');
    if(book_status) {
      this.$('#' + book_status).attr('selected', 'selected');
    }
    return this;
  },

  _setUpRaty: function () {
    var that = this;
    // Add listener on raty click
    this.$('#rating').raty({
      click: function(score, evt) {
        that.saveRating(score);
      }
    });

    // Initializing with personal rating or average rating, if available
    var personalReview = this.model.current_user_review();
    var personalRating = personalReview.get('rating');
    var rating = this.model.get('rating');

    if(personalRating) {
      that.$('#rating').raty('score', personalRating);
      that.$('#rating').append('<em>Your Rating: ' + personalRating + '<em>');
    } else if (rating) {
      that.$('#rating').raty('score', rating);
    }
  },

  listSelected: function (event) {
    event.preventDefault();
    var statusVal = $(event.target).val();

    var newOrExistingStatus = this.model.book_status();
    newOrExistingStatus.set({status: statusVal, book_id: this.model.get('id')});
    newOrExistingStatus.save();
  }, 

  saveRating: function (score) {
    var newOrExistingReview = this.model.current_user_review();
    
    newOrExistingReview.set({rating: score, book_id: this.model.get('id')});
    newOrExistingReview.save();
    KR.reviews.reset(newOrExistingReview);
    KR.activityStream.add({
      
    })
  }

});