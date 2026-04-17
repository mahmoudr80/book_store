part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}
final class WishListLoading extends WishListState {}
final class WishListSuccess extends WishListState {
  final WishListProduct wishListProduct;
   WishListSuccess(this.wishListProduct);
}
final class WishListFailed extends WishListState {
  final String error;

  WishListFailed(this.error);
}
