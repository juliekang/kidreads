KR.Models.Club = Backbone.Model.extend({
  url: function () {
    return "/kr/clubs/" + this.id;
  },

  parse: function (jsonResp) {
    if (jsonResp.members) {
      this.members().set(jsonResp.members);
      delete jsonResp.members;
    }
    if(jsonResp.club_streams) {
      this.club_streams().set(jsonResp.club_streams);
      delete jsonResp.club_streams;
    }
    return jsonResp;
  },

  members: function () {
    if (!this._members) {
      this._members = new KR.Collections.Users([]);
    }
    return this._members;
  },

  club_streams: function () {
    if(!this._club_streams) {
      this._club_streams = new KR.Collections.ActivityStreams([]);
    }
    return this._club_streams;
  }
});