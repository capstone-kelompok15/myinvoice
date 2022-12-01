class Invoice {
  String? storeName;
  String? alamatStore;
  String? invoiceID;
  String? userName;
  String? emailUser;
  String? alamatUser;
  String? dateInvoice;
  String? dateOverdue;

  List<Item>? items = [];
  String? totalProduct;
  String? subtotal;
  bool isPaid;

  Invoice({
    this.storeName,
    this.alamatStore,
    this.invoiceID,
    this.userName,
    this.emailUser,
    this.alamatUser,
    this.dateInvoice,
    this.dateOverdue,
    this.totalProduct,
    this.items,
    this.subtotal,
    this.isPaid = false,
  });
}

class Item {
  String? itemDescription;
  String? quantity;
  String? price;
  String? total;

  Item({
    this.itemDescription,
    this.quantity,
    this.price,
    this.total,
  });
}
