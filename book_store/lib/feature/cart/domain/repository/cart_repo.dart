import 'package:book_store/feature/cart/data/models/cart_model.dart';

abstract class CartRepo {
 Future<CartModel> getCartProducts();
}