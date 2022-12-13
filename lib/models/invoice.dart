
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
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'invoiceNumber': invoiceNumber,
      'customerName': customerName,
      'customerAddress': customerAddress,
      'totalAmount': totalAmount,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}