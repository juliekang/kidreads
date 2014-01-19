KR.Models.Book = Backbone.Model.extend({
  url: function () {
    return "/kr/books/" + this.id;
  }
})