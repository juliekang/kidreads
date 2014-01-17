KR.Models.Club = Backbone.Model.extend({
  parse: function (data) {
    var members = data.members;
    data.members = new KR.Collections.Users(members);
    return data;
  },

  toJSON: function () {
    var data = _.clone(this.attributes);
    return data;
  }
});