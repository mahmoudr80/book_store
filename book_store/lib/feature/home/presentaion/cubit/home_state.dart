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
