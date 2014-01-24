KR.Views.BookShow = Backbone.View.extend({
  events: {
    "change #list-selector" : "listSelected",
    "click button#new-review-submit" : "submit"
  },
  
  template: JST["books/show"],

  initialize: function () {
    this.listenTo(this.model, "add remove reset", this.render);
    this.listenTo(this.model.reviews(), "add reset change set", this.render);
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
    var rating = this.model.get('rating');

    if(personalReview) {
      var personalRating = personalReview.get('rating');
      if(personalRating) {
        that.$('#rating').raty('score', personalRating);
        that.$('#rating').append('<em>Your Rating: ' + personalRating + '<em>');
      }
    } else if (rating) {
      that.$('#rating').raty('score', rating);
    }
  },

  listSelected: function (event) {
    event.preventDefault();
    var that = this;
    var statusVal = $(event.target).val();

    var newOrExistingStatus = this.model.book_status();
    newOrExistingStatus.set({status: statusVal, book_id: this.model.id});
    newOrExistingStatus.save({
      success: function () {
        console.log("Saved!")
        that.$("#add-to-lists").popover({content: "Saved!", delay: { show: 500, hide: 100 }});
      }
    });

    var verb = '';

    switch (statusVal) {
    case 'current':
      verb = 'started reading';
      break;
    case 'read':
      verb = 'finished';
      break;
    case 'wish':
      verb = 'wishlisted';
      break;
    }

    KR.activityStreams.create({
      url: "/#books/" + this.model.id,
      activity_verb: verb,
      activity_object: this.model.get('title'),
      image_url: this.model.get('image_url')
    });   
  }, 

  saveRating: function (score) {
    var that = this;
    var review = this.model.current_user_review() || new KR.Models.Review();
    review.set({rating: score, book_id: that.model.id});
    this.model.reviews().add(review, {merge: true});
    review.save({}, {
      success: function (review) {
        KR.activityStreams.create({
          url: "/#books/" + that.model.id,
          activity_verb: "rated",
          activity_object: that.model.get('title'),
          image_url: that.model.get('image_url')
        });
      }
    });
  },

  submit: function (event) {
    event.preventDefault();
    var that = this;
    var formData = $('#new-review-form').serializeJSON();

    var review = this.model.current_user_review() || new KR.Models.Review();
    review.set({content: formData['content'], book_id: that.model.id});
    this.model.reviews().add(review, {merge: true});
    review.save({}, {
      success: function (review) {

        KR.activityStreams.create({
          url: "/#books/" + that.model.id,
          activity_verb: "reviewed",
          activity_object: that.model.get('title'),
          image_url: that.model.get('image_url')
        });
      }
    });

    $("#new-review-modal").modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
  },

});