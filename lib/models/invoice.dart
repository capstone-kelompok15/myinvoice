class Invoice {
  int? id;
  String? invoiceNumber;
  String? customerName;
  String? customerAddress;
  double? totalAmount;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Invoice({
    this.id,
    this.invoiceNumber,
    this.customerName,
    this.customerAddress,
    this.totalAmount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      invoiceNumber: json['invoiceNumber'],
      customerName: json['customerName'],
      customerAddress: json['customerAddress'],
      totalAmount: json['totalAmount'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoiceNumber'] = this.invoiceNumber;
    data['customerName'] = this.customerName;
    data['customerAddress'] = this.customerAddress;
    data['totalAmount'] = this.totalAmount;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
