KR.Views.BookShow = Backbone.View.extend({
  events: {
    "change #list-selector" : "listSelected",
  },
  
  template: JST["books/show"],

  initialize: function () {
    this.listenTo(this.model, "add remove reset", this.render)
  },

  render: function () {
    var that = this;
    var renderedContent = this.template({
      book: this.model
    });

    this.$el.html(renderedContent);
    // Adding listener on click
    this.$('#rating').raty({
      click: function(score, evt) {
        that.saveRating(score, evt);
      }
    });

    // Initializing with the average rating if available.
    var personalReview = this.model.current_user_review();
    var personalRating = personalReview.get('rating');
    var rating = this.model.get('rating');

    if(personalRating) {
      that.$('#rating').raty('score', personalRating);
      that.$('#rating').append('<em>Your Rating: ' + personalRating + '<em>');
    } else if (rating) {
      that.$('#rating').raty('score', rating);
    }   
    return this;
  },

  listSelected: function (event) {
    event.preventDefault();
    var statusVal = $(event.target).val();

    var status = new KR.Models.BookStatus({
      book_id: this.model.id, 
      status: statusVal
    });
    status.save();
  }, 

  saveRating: function (score, event) {
    var existingReview = KR.reviews._getReview(KR.currentUserID, this.model.get('id'));

    if(!existingReview) {
      review = new KR.Models.Review();
      review.collection = KR.reviews;
      KR.reviews.create({
        'rating': score,
        'book_id': this.model.get('id')
      });
    } else {
      existingReview.set('rating', score);
      existingReview.save();
    }
  }

});