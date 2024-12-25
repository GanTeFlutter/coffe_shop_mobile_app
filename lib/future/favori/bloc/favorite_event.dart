part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteListFirstEmit extends FavoriteEvent {}

class AddFavoriteEvenet extends FavoriteEvent {
  const AddFavoriteEvenet(this.coffee);
  final Coffee coffee;

  @override
  List<Object> get props => [coffee];
}

class RemoveFavorite extends FavoriteEvent {
  const RemoveFavorite(this.coffee);
  final Coffee coffee;

  @override
  List<Object> get props => [coffee];
}

class DeleteAllList extends FavoriteEvent {}
