import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/product/core/database/firebase_enum.dart';
import 'package:coffe_shop_mobile_app/product/model/postmodel/postmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_view_event.dart';
part 'home_view_state.dart';

class HomeViewBloc extends Bloc<HomeViewEvent, HomeViewState> {
  HomeViewBloc() : super(HomeViewInitial()) {
    on<LoadHomeView>(_onLoadBloc);
  }

  Future<void> _onLoadBloc(
    LoadHomeView event,
    Emitter<HomeViewState> emit,
  ) async {
    emit(HomeViewLoading());
    try {
      final querySnapshot = await FirebaseCollectionReferances.postModel.collectRef.get();
      final postModels = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Postmodel.fromJson(data);
      }).toList();
      emit(HomeViewLoaded(coffeList: postModels));
    } catch (error) {
      emit(HomeViewError("Veriler yüklenirken hata oluştu: $error"));
    }
  }
}
