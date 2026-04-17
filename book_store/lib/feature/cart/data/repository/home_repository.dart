import 'package:book_store/feature/cart/data/datasources/cart_remote_datasource.dart';
import 'package:book_store/feature/cart/domain/repository/cart_repo.dart';

import '../models/cart_model.dart';

class CartRepositoryImpl implements CartRepo{
final CartRemoteDatasource _datasource;

const CartRepositoryImpl(this._datasource);

  @override
  Future<CartModel> getCartProducts() async{
    return  await _datasource.getCartProducts();

  }



}