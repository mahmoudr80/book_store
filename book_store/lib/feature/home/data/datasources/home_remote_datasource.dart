import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/api_result.dart';
import 'package:book_store/feature/home/data/models/slider_model.dart';

import '../../../../core/network/api_helper.dart';

class HomeRemoteDatasource {
  final ApiHelper _helper;

  HomeRemoteDatasource(this._helper);

  Future <SliderModel>getSliders() async {
    final response=await _helper.get(ApiConstants.sliderEndPoint);
    if(response is Success){
       return SliderModel.fromJson(response.data) ;
    } else if(response is Failure){
      throw Exception(response.errorModel.error);
    }
    else{
      throw Exception("Unexpected error");
    }
  }
}