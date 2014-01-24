KR.Views.ClubShow = Backbone.View.extend({
  events: {
    "click button#new-member-submit" : "submitMember",
  },
  
  template: JST["clubs/show"],

  initialize: function () {
    this.listenTo(this.model.members(), "all", this.render)
  },

  render: function () {
    var renderedContent = this.template({
      club: this.model,
      remainders: this._remainingKids()
    });
    
    this.$el.html(renderedContent);
    
    var view = new KR.Views.ActivityStreamsIndex({
      collection: this.model.club_streams(),
    });
    this.$("#club_streams").html(view.render().$el);

    return this;
  },

  _remainingKids: function () {
    var kids = KR.kids.clone();
    var members = this.model.members().clone();
    var remainders = []

    kids.map(function (kid) {
      var member = members.get(kid.id);
      if(!member) {
        remainders.push(kid);
      }
    });
    return new KR.Collections.Users(remainders);
  },

  submitMember: function (event) {
    var that = this;
    event.preventDefault();
    var memberIDs = $('#new-member-form').serializeJSON().members;

    memberIDs.forEach(function (memberID) {
      var membership = { member_id: memberID, club_id: that.model.id, membership_type: "kid" };

      membership = new KR.Models.ClubMembership(membership);
      membership.save({}, {
        success: function (membership) {
          var member = KR.kids.get(membership.get('member_id'));
          that.model.members().add(member);
        }     
      });
    });
    
    $("#new-member-modal").modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();  
  }
  
});