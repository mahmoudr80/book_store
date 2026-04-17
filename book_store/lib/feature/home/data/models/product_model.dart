class BookModel {
  final int id;
  final String name;
  final String description;
  final String category;
  final String price;
  final num discount;
  final int  stock;
  final num best_seller;
  final String image;

 const BookModel({required this.id,required  this.name,required  this.description,
    required this.price,required  this.discount,required  this.stock,
    required this.best_seller,required  this.image, required this.category,

 });
  factory BookModel.fromJson(Map<String,dynamic>json){
    return BookModel(id: json["id"], name: json["name"],
        description: json["description"], price: json["price"],
        discount: json["discount"],
        stock: json["stock"], best_seller: json["best_seller"],
        image: json["image"], category: json['category']);
  }



}



class BookListModel{
  final List<BookModel>? data;
  final String ?message;
  final  List error;
  final int ?status;

 const BookListModel({required this.data,required this.message,
   required this.error,required this.status});
factory BookListModel.fromJson(Map<String,dynamic>json){

  return BookListModel(data: (json["data"]["data"] as List).map((element)=>BookModel.fromJson(element)).toList(),
      message: json["message"], error: json["error"], status: json["status"]);
}

 BookListModel copyWith({List<BookModel>? data,String ?message,
  List ?error, int ?status}){
  return BookListModel(data: data??this.data,
  message: message??this.message,
  error: error??this.error, status: status??this.status);
}

  factory BookListModel.searchFromJson(Map<String,dynamic>json){

    return BookListModel(data: (json["data"]["products"] as List).map((element)=>BookModel.fromJson(element)).toList(),
        message: json["message"], error: json["error"], status: json["status"]);
  }

}