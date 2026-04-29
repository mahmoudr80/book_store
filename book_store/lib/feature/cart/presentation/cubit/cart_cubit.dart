import 'package:bloc/bloc.dart';
import 'package:book_store/feature/cart/data/models/cart_model.dart';
import 'package:book_store/feature/cart/domain/usecase/remove_item_usecase.dart';
import 'package:book_store/feature/cart/domain/usecase/updateCartItemUseCase.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/getCartProductsUseCase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartProductsUseCase  getCartProductsUseCase;
  final UpdateCartItemUseCase  updateCartItemUseCase;
  final RemoveItemUseCase removeItemUseCase;
  CartCubit( {required this.getCartProductsUseCase,
    required this.updateCartItemUseCase,
    required this.removeItemUseCase}) : super(CartInitial());

  void getCartProducts()async{
    if(isClosed){return;}
    emit(CartLoading());
    try{
      final CartModel cartModel=await getCartProductsUseCase.call();
      if(isClosed){return;}
      emit(CartSuccess(cartModel));
    }catch(e){
      if(isClosed){return;}
      emit(CartFailure(e.toString()));
    }
  }

  void update(int id,int quantity)async{
  final response=await updateCartItemUseCase(id,quantity);
  if(response){
    getCartProducts();
  }
  }
  void removeItem(int id)async{
    final response=await removeItemUseCase(id);
    if(response){
      getCartProducts();
    }
  }
}
