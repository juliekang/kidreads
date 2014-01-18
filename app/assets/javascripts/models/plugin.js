var Plugin = Backbone.Model.extend({
    label: function () {
        return this.get("name");
    }
});