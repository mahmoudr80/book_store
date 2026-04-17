class CartItem {
  final int item_id;
  final int item_product_id;
  final String item_product_name;
  final String item_product_image;
  final String item_product_price;
  final num item_product_discount;
  final num item_product_price_after_discount;
  final int item_product_stock;
  final int item_quantity;
  final num item_total;

 const CartItem({required this.item_id,required  this.item_product_name,
    required this.item_product_price,required  this.item_product_discount,required  this.item_product_stock,
    required  this.item_product_image, required this.item_product_id,
   required this.item_product_price_after_discount, required this.item_quantity, required this.item_total,

 });
  factory CartItem.fromJson(Map<String,dynamic>json){
    return CartItem(item_id: json["item_id"], item_product_name: json["item_product_name"]
        , item_product_price: json["item_product_price"], item_product_discount: json["item_product_discount"],
        item_product_stock: json["item_product_stock"],
        item_product_image: json["item_product_image"],
        item_product_id: json["item_product_id"],
        item_product_price_after_discount: json["item_product_price_after_discount"],
        item_quantity: json["item_quantity"], item_total: json["item_total"]);
  }
  
}



class CartModel{
  final Data data;
  final String ?message;
  final  List error;
  final int ?status;

 const CartModel({ required this.data, this.message, required this.error, this.status});
factory CartModel.fromJson(Map<String,dynamic>json){

  return CartModel(data: Data.fromJson(json["data"]),
      message: json["message"], error: (json["error"] as List), status: json["status"]);
}

  }


class Data {
  final int id;
  final User user;
  final String total;
  final List<CartItem>cart_items;

  const Data({required this.id,required  this.user,
    required this.total,required  this.cart_items});
  
  factory Data.fromJson(Map<String,dynamic>json){
    return Data(id: json["id"], user: User.fromJson(json["user"]) , total: json["total"],
        cart_items:(json["cart_items"] as List).map((element) =>CartItem.fromJson(element) ,).toList() );
  }

}
class User {
  final int user_id;
  final String user_name;

  const User({required this.user_id,required  this.user_name});
  factory User.fromJson(Map<String,dynamic>json){
    return User(user_id: json["user_id"], user_name:  json["user_name"]);
  }
}