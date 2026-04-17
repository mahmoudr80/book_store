import 'package:bloc/bloc.dart';
import 'package:book_store/feature/wish_list/data/model/wish_list_product.dart';
import 'package:book_store/feature/wish_list/data/repositories/wish_list_repository.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit(this._repository) : super(WishListInitial());
final WishListRepository _repository;
  void getWishList() async {
    emit(WishListLoading());
    try{
      final WishListProduct wishListProduct=await _repository.getWishListProducts();
      emit(WishListSuccess(wishListProduct));
    }catch(e){
      emit(WishListFailed(e.toString()));
    }
  }

}
