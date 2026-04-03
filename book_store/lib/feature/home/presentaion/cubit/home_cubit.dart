import 'package:bloc/bloc.dart';
import 'package:book_store/feature/home/data/models/slider_model.dart';
import 'package:book_store/feature/home/data/repository/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

   HomeCubit(this._repository) : super(HomeInitial());

   Future<void>getSliders() async {
     emit(SliderLoading());
     try{
      final sliders= await _repository.getSlider();
      emit(SliderSuccess(sliders));
     }catch(e){
       final message = e.toString().replaceFirst('Exception: ', '');
       emit(SliderFailed(message));
     }
   }
}
