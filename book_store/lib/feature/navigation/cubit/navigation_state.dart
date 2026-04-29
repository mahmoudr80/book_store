part of 'navigation_cubit.dart';

@immutable
sealed class NavigationState {
const NavigationState();
}

final class NavigationInitial extends NavigationState {
}
final class NavigationWishList extends NavigationState {
}
final class NavigationCart extends NavigationState {
}

final class NavigationProfile extends NavigationState {
}