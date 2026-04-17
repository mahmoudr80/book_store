import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/api_result.dart';
import 'package:book_store/feature/cart/data/models/cart_model.dart';
import '../../../../core/network/api_helper.dart';

class CartRemoteDatasource {
  final ApiHelper _helper;

 const CartRemoteDatasource(this._helper);


  Future <CartModel>getCartProducts() async {
    final response=await _helper.get(path:  ApiConstants.cartProductEndPoint);
    if(response is Success){
      final cart = response.data;
      return CartModel.fromJson(cart);
    } else if(response is Failure){
      throw Exception(response.errorModel.error);
    }
    else{
      throw Exception("Unexpected error");
    }
  }
}