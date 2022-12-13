class Customer {
  int? id;
  String? fullName;
  String? email;
  String? displayProfilePictureUrl;
  String? token;

  Customer({
    this.id,
    this.fullName,
    this.email,
    this.displayProfilePictureUrl,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    displayProfilePictureUrl = json['display_profile_picture_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['display_profile_picture_url'] = this.displayProfilePictureUrl;

    return data;
  }
}
