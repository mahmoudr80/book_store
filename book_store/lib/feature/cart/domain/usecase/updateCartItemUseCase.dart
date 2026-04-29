import 'package:book_store/feature/cart/data/models/cart_model.dart';
import 'package:book_store/feature/cart/domain/repository/cart_repo.dart';

class UpdateCartItemUseCase {
  final CartRepo _repo;

  const UpdateCartItemUseCase(this._repo);

  Future<bool> call(int id,int quantity) async {
    return await _repo.updateItem(id, quantity);
  }
}