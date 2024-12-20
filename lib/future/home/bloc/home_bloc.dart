import 'package:bloc/bloc.dart';
import 'package:coffe_shop_mobile_app/product/model/coffee/coffee.dart';
import 'package:coffe_shop_mobile_app/product/enums/e.firebase.dart';
import 'package:coffe_shop_mobile_app/product/service/firebase_service.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({IFirebaseService? firebaseService})
      : _firebaseService = firebaseService ?? FirebaseService(),
        super(HomeInitial()) {
    on<HomeKategoryEvent>(_onLoadCategory);
  }

  final IFirebaseService _firebaseService;
  Future<void> _onLoadCategory(HomeKategoryEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());

      final coffees = await _firebaseService.fetchCollection(
        collectionName: FirebaseCollDocName.coffee.name,
        docName: event.message,
        fromJson: Coffee.fromJson,
      );

      emit(HomeLoaded(listCoffee: coffees));
    } on FirebaseServiceException catch (e) {
      emit(HomeErrorState(message: e.toString()));
    } catch (e) {
      
   
    }
  }
}
