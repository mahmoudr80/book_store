import 'dart:convert';

import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/api_result.dart';
import 'package:book_store/feature/home/data/models/product_model.dart';
import 'package:book_store/feature/home/data/models/slider_model.dart';

import '../../../../core/network/api_helper.dart';

class HomeRemoteDatasource {
  final ApiHelper _helper;

  HomeRemoteDatasource(this._helper);

  Future <SliderModel>getSliders() async {
    final response=await _helper.get(path:  ApiConstants.sliderEndPoint);
    if(response is Success){
       return SliderModel.fromJson(response.data) ;
    } else if(response is Failure){
      throw Exception(response.errorModel.error);
    }
    else{
      throw Exception("Unexpected error");
    }
  }

  Future <BookListModel>getBestSellerProducts() async {
    final response=await _helper.get(path:  ApiConstants.bestSellerProductEndPoint);
    if(response is Success){
      final products = response.data;
      return BookListModel.fromJson(products) ;
    } else if(response is Failure){
      throw Exception(response.errorModel.error);
    }
    else{
      throw Exception("Unexpected error");
    }
  }

  Future <BookListModel>searchProduct(String name) async {
    final response=await _helper.get(path:  ApiConstants.searchOnProductEndPoint,param: {
      "name":name
    });
    if(response is Success){
      final products = response.data;
      return BookListModel.searchFromJson(products) ;
    } else if(response is Failure){
      throw Exception(response.errorModel.error);
    }
    else{
      throw Exception("Unexpected error");
    }
  }


}