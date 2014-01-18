KR.Models.Reviews = Backbone.Model.extend({
  url: function () {
    return "/kr/reviews/" + this.id;
  },
});