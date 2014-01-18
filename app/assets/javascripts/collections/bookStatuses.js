KR.Collections.BookStatuses = Backbone.Collection.extend({
  url: "/kr/book_statuses",
  model: KR.Models.BookStatus
});