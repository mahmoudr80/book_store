part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class SliderSuccess extends HomeState {
  final List<Slider>sliderUrls;
   SliderSuccess(this.sliderUrls);
}
final class SliderFailed extends HomeState {
  final String error;
  SliderFailed(this.error);
}
final class SliderLoading extends HomeState {}

final class BestSellerSuccess extends HomeState {
  final BookListModel bestSellerBooks;
  BestSellerSuccess( this.bestSellerBooks);
}
final class BestSellerFailed extends HomeState {
  final String error;
  BestSellerFailed(this.error);
}
final class BestSellerLoading extends HomeState {}

final class SearchSuccess extends HomeState {
  final BookListModel bestSellerBooks;
  SearchSuccess( this.bestSellerBooks);
}
final class SearchFailed extends HomeState {
  final String error;
  SearchFailed(this.error);
}
final class SearchLoading extends HomeState {}