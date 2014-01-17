KR.Models.Club = Backbone.Model.extend({
  url: function () {
    return "/kr/clubs/" + this.id;
  }
});