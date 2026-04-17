import 'package:book_store/feature/cart/data/models/cart_model.dart';
import 'package:book_store/feature/cart/domain/repository/cart_repo.dart';

class GetCartProductsUseCase {
  final CartRepo _repo;

  const GetCartProductsUseCase(this._repo);

 Future<CartModel> call() async {
    return await _repo.getCartProducts();
  }
}