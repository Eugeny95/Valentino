import 'package:bloc/bloc.dart';
import 'package:data_layer/models/dish_http_model.dart';
import 'package:data_layer/models/menu_http_model.dart';
import 'package:meta/meta.dart';

part 'basket_bloc_event.dart';
part 'basket_bloc_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketState(basketStatus: BasketStatus.initial)) {
    on<AddDishEvent>((event, emit) {
      print('dishadd');
      
    });
  }
}
