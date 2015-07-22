SixthCents.Views.TransactionItem = Backbone.CompositeView.extend({
  template: JST["transactions/transaction_item"],
  tagName: "div",
  className: "transactions-list-item group",
  render: function(){
    var content = this.template({ transaction: this.model })

    this.$el.html(content);

    return this;
  }
})
