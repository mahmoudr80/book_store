import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/api_helper.dart';
import 'package:book_store/core/network/api_result.dart';
import 'package:book_store/feature/wish_list/data/model/wish_list_product.dart';

class WishListRemoteDatasource {
  final ApiHelper _helper;

 const WishListRemoteDatasource(this._helper);

  Future<WishListProduct>getWishListProducts() async {
    final response = await _helper.get(path:  ApiConstants.wishListEndPoint);

    if(response is Success){
      final WishListProduct wishList=WishListProduct.fromJson(response.data);
      return wishList;
    }
    else if(response is Failure){
      throw response.errorModel.error;
    }
throw Exception("UnExpected error");
  }
}