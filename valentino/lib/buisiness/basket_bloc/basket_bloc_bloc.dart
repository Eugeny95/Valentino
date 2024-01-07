import 'package:bloc/bloc.dart';
import 'package:data_layer/models/dish_http_model.dart';

import 'package:meta/meta.dart';

part 'basket_bloc_event.dart';
part 'basket_bloc_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketState(basketStatus: BasketStatus.initial)) {
    List<Position> positions = [];
    on<AddDishEvent>((event, emit) {
      bool noAddflag = false;
      for (Position position in positions) {
        if (position.dish == event.dishHttpModel) {
          position.count++;
          noAddflag = true;
          break;
        }
      }
      if (!noAddflag) {
        positions.add(Position(dish: event.dishHttpModel, count: 1));
      }

      emit(BasketState(basketStatus: BasketStatus.done, positions: positions));
    });

    on<RemoveDishEvent>((event, emit) {});

    on<GetBasketPositions>((event, emit) {
      emit(BasketState(basketStatus: BasketStatus.done, positions: positions));
    });
  }
}
