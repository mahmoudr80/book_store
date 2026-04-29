part of 'home_cubit.dart';

@immutable
 class HomeState {
  final EnHomeAction action;
  final EnHomeStatus status;

  const HomeState({
    this.action = EnHomeAction.non,
    this.status=EnHomeStatus.init,
    this.sliderUrls, this.bestSellerBooks,
    this.allBooks, this.error});
  final List<Slider>?sliderUrls;
  final BookListModel ?bestSellerBooks;
  final BookListModel ?allBooks;
  final String ?error;

  HomeState copyWith({EnHomeAction ?newAction, EnHomeStatus? newStatus, List<
      Slider>?newSliderUrls,
    BookListModel ?newBestSellerBooks
    , BookListModel ?newAllBooks, String ?newError}){
    return HomeState(action: newAction??action,status:newStatus??status
    ,error:newError??error,allBooks: newAllBooks??allBooks,
        bestSellerBooks:newBestSellerBooks??bestSellerBooks,sliderUrls: newSliderUrls??sliderUrls  );
  }
}
//
// final class HomeInitial extends HomeState {}
// final class SliderSuccess extends HomeState {
//   final List<Slider>sliderUrls;
//    SliderSuccess(this.sliderUrls);
// }
// final class SliderFailed extends HomeState {
//   final String error;
//   SliderFailed(this.error);
// }
// final class SliderLoading extends HomeState {}
//
// final class BestSellerSuccess extends HomeState {
//   final BookListModel bestSellerBooks;
//   BestSellerSuccess( this.bestSellerBooks);
// }
// final class BestSellerFailed extends HomeState {
//   final String error;
//   BestSellerFailed(this.error);
// }
// final class BestSellerLoading extends HomeState {}
//
// final class AllBooksSuccess extends HomeState {
//   final BookListModel bestSellerBooks;
//   AllBooksSuccess( this.bestSellerBooks);
// }
// final class AllBooksFailed extends HomeState {
//   final String error;
//   AllBooksFailed(this.error);
// }
// final class AllBooksLoading extends HomeState {}
//
// final class SearchSuccess extends HomeState {
//   final BookListModel allBooks;
//   SearchSuccess( this.allBooks);
// }
// final class SearchFailed extends HomeState {
//   final String error;
//   SearchFailed(this.error);
// }
// final class SearchLoading extends HomeState {}
//
// final class AddToWishListSuccess extends HomeState {}
// final class AddToCartSuccess extends HomeState {}
