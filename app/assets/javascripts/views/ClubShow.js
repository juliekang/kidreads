KR.Views.ClubShow = Backbone.View.extend({
  events: {},
  
  template: JST["clubs/show"],

  render: function () {
    var renderedContent = this.template({
      club: this.model
    });
    
    this.$el.html(renderedContent);
    
    var view = new KR.Views.ActivityStreamsIndex({
      collection: this.model.club_streams(),
      remainders: this._remainingKids()
    });
    this.$("#club_streams").html(view.render().$el);

    return this;
  },

  _remainingKids: function () {
    var kids = KR.kids.clone();
    var members = this.model.members().clone();

    var remainder = kids.map(function (kid) {
      var member = members.get(kid.id);
      if(!member) {
              console.log("there is a remainder!" + kid.id)

        return member.toJSON();
      }
    });

    console.log(remainder);
    return remainder;
  }
  
});