import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favori_state.dart';

class FavoriCubit extends Cubit<FavoriState> {
  FavoriCubit() : super(FavoriInitial());

  
}
