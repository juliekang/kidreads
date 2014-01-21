KR.Collections.ActivityStreams = Backbone.Collection.extend({
  url: "/kr/streams",
  model: KR.Models.ActivityStreamItem
});