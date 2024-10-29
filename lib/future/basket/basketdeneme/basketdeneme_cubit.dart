import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'basketdeneme_state.dart';

class BasketdenemeCubit extends Cubit<BasketdenemeState> {
  BasketdenemeCubit() : super(const BasketdenemeInitial(basketSayi: 0));



}
