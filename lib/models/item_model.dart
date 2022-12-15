class ItemModel {
  int? invoiceDetailId;
  String? product;
  int? quantity;
  int? price;
  String? createdAt;
  String? updatedAt;

  ItemModel(
      {this.invoiceDetailId,
      this.product,
      this.quantity,
      this.price,
      this.createdAt,
      this.updatedAt});

  ItemModel.fromJson(Map<String, dynamic> json) {
    invoiceDetailId = json['invoice_detail_id'];
    product = json['product'];
    quantity = json['quantity'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_detail_id'] = this.invoiceDetailId;
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
