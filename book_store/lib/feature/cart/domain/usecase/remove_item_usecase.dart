import 'package:book_store/feature/cart/data/models/cart_model.dart';
import 'package:book_store/feature/cart/domain/repository/cart_repo.dart';

class RemoveItemUseCase {
  final CartRepo _repo;

  const RemoveItemUseCase(this._repo);

  Future<bool> call(int id) async {
    return await _repo.removeItem(id);
  }
}