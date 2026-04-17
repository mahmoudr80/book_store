class AuthUserModel {
  final int? id;
  final String name;
  final String email;
  final String? password;
  final String? password_confirmation;
  final String? address;
  final String? city;
  final String? phone;
  final String? image;
  final bool email_verified;

  AuthUserModel({
    this.id,
    required this.name,
    required this.email,
    this.address,
    this.city,
    this.phone,
    this.image,
    this.email_verified = false,
    this.password,
    this.password_confirmation,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      image: json["image"],
      address: json["address"],
      city: json["city"],
      email_verified: json["email_verified"],
      phone: json["phone"],
    );
  }

  Map<String,dynamic>toJson(){
    return {
      "name": name,
      "email": email,
      "address": address,
      "city": city,
      "phone": phone,
      "email_verified": email_verified,
      "image":image,
      "password_confirmation":password_confirmation,
      "password":password
    };
  }
}
