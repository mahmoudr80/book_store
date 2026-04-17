import 'package:bloc/bloc.dart';
import 'package:book_store/feature/home/data/models/product_model.dart';
import 'package:book_store/feature/home/data/models/slider_model.dart';

import 'package:meta/meta.dart';

import '../../data/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;
  //final SearchUseCase ?searchUseCase;
   HomeCubit(this._repository,
      // {this.searchUseCase}
       ) : super(HomeInitial());

   Future<void>getSliders() async {
     if (isClosed) return;
     emit(SliderLoading());
     try{
      final sliders= await _repository.getSlider();

      if (isClosed) return;
      emit(SliderSuccess(sliders.data.sliders));
     }catch(e){
       final message = e.toString().replaceFirst('Exception: ', '');

       if (isClosed) return;
       emit(SliderFailed(message));
     }
   }

  Future<void>getBestSeller() async {
    if (isClosed) return;
    emit(BestSellerLoading());
    try{
      final bestSeller= await _repository.getBestSeller();

      if (isClosed) return;
      emit(BestSellerSuccess(bestSeller));
    }catch(e){
      final message = e.toString().replaceFirst('Exception: ', '');

      if (isClosed) return;
      emit(BestSellerFailed(message));
    }
  }

  Future<void>searchOnBook(String name) async {
     // if(searchUseCase==null){
     //   return;
     // }
    if (isClosed) return;
    emit(SearchLoading());
    try{
      final BookListModel searchedBooks = await _repository.searchProduct(name);
      if (isClosed) return;
      emit(SearchSuccess(searchedBooks));
    }catch(e){
      final message = e.toString().replaceFirst('Exception: ', '');

      if (isClosed) return;
      emit(SearchFailed(message));
    }
  }
}
