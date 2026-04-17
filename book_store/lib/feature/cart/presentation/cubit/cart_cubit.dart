import 'package:bloc/bloc.dart';
import 'package:book_store/feature/cart/data/models/cart_model.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/getCartProductsUseCase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartProductsUseCase  getCartProductsUseCase;
  CartCubit(this.getCartProductsUseCase) : super(CartInitial());

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
}
