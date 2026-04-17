import 'package:book_store/feature/wish_list/data/datasource/wish_list_remote_datasource.dart';

import '../model/wish_list_product.dart';

class WishListRepository {
  final WishListRemoteDatasource _datasource;

  const WishListRepository(this._datasource);
  Future<WishListProduct> getWishListProducts() async {
    final response =await _datasource.getWishListProducts();
    return response;
  }
}