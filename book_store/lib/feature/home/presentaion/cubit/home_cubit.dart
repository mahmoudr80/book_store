import 'package:bloc/bloc.dart';
import 'package:book_store/feature/home/data/models/product_model.dart';
import 'package:book_store/feature/home/data/models/slider_model.dart';

import 'package:meta/meta.dart';

import '../../data/repository/home_repository.dart';

part 'home_state.dart';

enum EnHomeAction{getSliders,getBestSeller,getAllProducts,searchOnProduct
,addToWishList,addToCart,non}
enum EnHomeStatus{loading,success,failed,init }

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;
   HomeCubit(this._repository,
       ) : super(HomeState());

   Future<void>getSliders() async {
     if (isClosed) return;
     emit(state.copyWith(newAction: EnHomeAction.getSliders,newStatus: EnHomeStatus.loading));
     try{
      final sliders= await _repository.getSlider();

      if (isClosed) return;
      emit(state.copyWith(newAction: EnHomeAction.getSliders,newStatus: EnHomeStatus.success,newSliderUrls:sliders.data.sliders ));
     }catch(e){
       final message = e.toString().replaceFirst('Exception: ', '');
       if (isClosed) return;
       emit(state.copyWith(newAction: EnHomeAction.getSliders,newStatus: EnHomeStatus.failed,newError: message));
     }
   }

  Future<void>getBestSeller() async {
    if (isClosed) return;
    emit(state.copyWith(newAction: EnHomeAction.getBestSeller,newStatus: EnHomeStatus.loading));
    try{
      final bestSeller= await _repository.getBestSeller();
      if (isClosed) return;
      emit(state.copyWith(newAction: EnHomeAction.getBestSeller,newStatus: EnHomeStatus.success,newBestSellerBooks: bestSeller));
    }catch(e){
      final message = e.toString().replaceFirst('Exception: ', '');
      if (isClosed) return;
      emit(state.copyWith(newAction: EnHomeAction.getBestSeller,newStatus: EnHomeStatus.failed,newError: message));
    }
  }
  Future<void>getAllProducts() async {
    if (isClosed) return;
    emit(state.copyWith(newAction: EnHomeAction.getAllProducts,newStatus: EnHomeStatus.loading));
    try{
      final allProducts= await _repository.getAllProducts();
      if (isClosed) return;
      emit(state.copyWith(newAction: EnHomeAction.getAllProducts,newStatus: EnHomeStatus.success,newAllBooks:allProducts ));
    }catch(e){
      final message = e.toString().replaceFirst('Exception: ', '');
      if (isClosed) return;
      emit(state.copyWith(newAction: EnHomeAction.getAllProducts,newStatus: EnHomeStatus.failed,newError: message));
    }
  }

  Future<void>searchOnBook(String name) async {
    if (isClosed) return;
    emit(state.copyWith(newAction: EnHomeAction.searchOnProduct,newStatus: EnHomeStatus.loading));
    try{
      final BookListModel searchedBooks = await _repository.searchProduct(name);
      if (isClosed) return;
      emit(state.copyWith(newAction: EnHomeAction.searchOnProduct,newStatus: EnHomeStatus.success,newAllBooks: searchedBooks));
    }catch(e){
      final message = e.toString().replaceFirst('Exception: ', '');
      if (isClosed) return;
      emit(state.copyWith(newAction: EnHomeAction.searchOnProduct,newStatus: EnHomeStatus.failed,newError: message));
    }
  }

  Future<void>addToWishList(int id) async {
    emit(state.copyWith(newAction: EnHomeAction.addToWishList,newStatus: EnHomeStatus.loading));
    final response=await  _repository.addToWishList(id);
    if(response){
      emit(state.copyWith(newAction: EnHomeAction.addToWishList,newStatus: EnHomeStatus.success));
    }else{
      emit(state.copyWith(newAction: EnHomeAction.addToWishList,newStatus: EnHomeStatus.failed));
    }
  }

  Future<void>addToCart(int id) async {
    emit(state.copyWith(newAction: EnHomeAction.addToCart,newStatus: EnHomeStatus.loading));
    final response=await  _repository.addToCart(id);
    if(response){
      emit(state.copyWith(newAction: EnHomeAction.addToCart,newStatus: EnHomeStatus.success));
    }
    else{
      emit(state.copyWith(newAction: EnHomeAction.addToCart,newStatus: EnHomeStatus.failed));
    }
  }
}
