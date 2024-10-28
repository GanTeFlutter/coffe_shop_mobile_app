part of 'home_view_bloc.dart';

@immutable
abstract class HomeViewEvent {}

class HomeViewInitialEvent extends HomeViewEvent {}

class HomeViewLoadingEvent extends HomeViewEvent {}

class HomeViewLoadedEvent extends HomeViewEvent {}
