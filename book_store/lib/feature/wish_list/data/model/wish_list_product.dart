
class WishListProduct {
  final List<Product> data;
  final String?message;
  final List error;
  final int status;

  WishListProduct({required this.data,required  this.message,
    required  this.error,required  this.status});

  factory WishListProduct.fromJson(Map<String,dynamic>json){
    return WishListProduct(data: (json["data"]["data"] as List)
        .map((element) => Product.fromJson(element),).toList(),
        message: json["message"], error: json["error"], status: json["status"]);
  }

}
class Product{
  final int id;
  final String name;
  final String description;
  final String price;
  final num discount;
  final int stock;
  final int best_seller;
  final String image;
  final String category;
  const Product({required this.id,required  this.name,required  this.description,
    required this.price,required  this.discount,required  this.stock,
    required this.best_seller,required  this.image,
    required this.category});
  factory Product.fromJson(Map<String,dynamic>json){
    return Product(id: json["id"], name: json["name"],
        description: json["description"], price: json["price"],
        discount: json["discount"],
        stock: json["stock"], best_seller: json["best_seller"],
        image: json["image"], category: json["category"]);
  }
}