KR.Collections.SearchResults = Backbone.Collection.extend({
  url: "/search/query",
  model: KR.Models.Book
});