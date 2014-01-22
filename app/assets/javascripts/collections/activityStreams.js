KR.Collections.ActivityStreams = Backbone.Collection.extend({
  url: "/kr/streams",
  model: KR.Models.ActivityStreamItem,

  // parse: function(response) {
  //   this.page_number = parseInt(response.page);
  //   this.total_pages = parseInt(response.total_pages);
  //   return response.models;
  // }
});