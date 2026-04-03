class SliderModel {
  final Data  data;
  final String message;
  final List error;
  final int status;

  const SliderModel({
    required this.message,
    required this.error,
    required this.status, required this.data,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      data: Data.fromJson(json["data"]),
      message: json["message"],
      error: json["error"],
      status: json["status"],
    );
  }
}

class Data{
 final List<Slider>sliders;

 const Data(this.sliders);
 factory Data.fromJson(Map<String,dynamic>json){
   List slidersJson=json["sliders"];
   List <Slider>slidersTemp=[];
   for(int i = 0 ; i< slidersJson.length;i++){
     slidersTemp.add(Slider(slidersJson[i]["image"]));
   }
   return Data(slidersTemp);
 }
}

class Slider {
  final String imgUrl;
  const Slider(this.imgUrl);
}

