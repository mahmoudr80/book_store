  class UserModel {
  final Data data;
  final String message;
  final List error;
  final int status;
  const UserModel({required this.data,required  this.message,
    required this.error,required  this.status});

  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(data:Data.fromJson(json["data"]) ,
        message: json["message"], error: (json["error"] as List), status: json["status"]);

  }

  }
  class Data {
  final int id;
  final String name;
  final String email;
  final String? address;
  final String? city;
  final String? phone;
  final String? image;
  final bool email_verified;

  const Data(
      {required this.id,required  this.name,required  this.email,
        this.address, this.city, this.phone,
        this.image, this.email_verified=false});

  factory Data.fromJson(Map<String,dynamic>json){
    return Data(id: json["id"], name:  json["name"], email:  json["email"],
    image: json["image"],email_verified:json["email_verified"] ,
        city:json["city"] ,address:json["address"] ,phone:json["phone"] );
  }

  }
