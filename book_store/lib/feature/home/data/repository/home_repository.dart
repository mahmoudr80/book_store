import 'package:book_store/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:book_store/feature/home/data/models/slider_model.dart';

class HomeRepository {
final HomeRemoteDatasource _datasource;

const HomeRepository(this._datasource);

  Future<List<Slider>> getSlider()async{
    final response= await _datasource.getSliders();
    return response.data.sliders;
  }
}