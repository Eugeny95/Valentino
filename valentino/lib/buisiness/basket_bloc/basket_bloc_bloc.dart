import 'package:bloc/bloc.dart';
import 'package:data_layer/models/http_models/dish_http_model.dart';
import 'package:meta/meta.dart';
part 'basket_bloc_event.dart';
part 'basket_bloc_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  List<Position> positions = [];
  double totalCost = 0;
  BasketBloc() : super(BasketState(basketStatus: BasketStatus.initial)) {
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

      positions.firstWhere((element) {
        if (element.dish == event.dishHttpModel)
          return true;
        else
          return false;
      }).calculateCost();
      totalCost = 0;
      for (Position position in positions) {
        totalCost = totalCost + position.allCost;
      }
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost));
    });

    on<EmptyBasketEvent>((event, emit) {});

    on<RemoveDishEvent>((event, emit) {
      for (Position position in positions) {
        if (position.dish!.id == event.dishId) {
          if (position.count == 1) break;
          position.count--;
          position.calculateCost();
          break;
        }
      }
      totalCost = 0;
      for (Position position in positions) {
        totalCost = totalCost + position.allCost;
      }
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost));
    });

    on<RemovePositionEvent>((event, emit) {
      for (Position position in positions) {
        if (position.dish!.id == event.dishId) {
          positions.remove(position);
          break;
        }
      }
      totalCost = 0;
      for (Position position in positions) {
        totalCost = totalCost + position.allCost;
      }
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost));
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost));
    });

    on<GetBasketPositions>((event, emit) {
      print('get basket positions');
      totalCost = 0;
      for (Position position in positions) {
        totalCost = totalCost + position.allCost;
      }
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost));
    });
  }

  List<Position> getPositions() {
    return positions;
  }

  double getTotalCost() {
    return totalCost;
  }
}
