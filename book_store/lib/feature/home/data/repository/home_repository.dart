import 'package:book_store/feature/home/data/datasources/home_remote_datasource.dart';

import '../models/product_model.dart';
import '../models/slider_model.dart';

class HomeRepository //implements HomeRepository
{
final HomeRemoteDatasource _datasource;

const HomeRepository(this._datasource);


@override
  Future <BookListModel>getBestSeller() async {
    final response= await _datasource.getBestSellerProducts();
    return response;
  }

  @override
  Future<BookListModel> getBooksByName(String name) async {
    return await getBestSeller();
  }

  @override
  Future<SliderModel> getSlider() async {
     SliderModel sliderModel= await _datasource.getSliders();
    return  sliderModel;
  }

Future <BookListModel>searchProduct(String name) async{
return await  _datasource.searchProduct(name);
}

}