import 'package:auth_feature/data/auth_data.dart';
import 'package:bloc/bloc.dart';
import 'package:data_layer/models/http_models/address_http_model.dart';
import 'package:data_layer/models/http_models/dish_http_model.dart';
import 'package:data_layer/models/http_models/order_http_model.dart';
import 'package:data_layer/models/http_models/position_http_model.dart';
import 'package:data_layer/network/order_repository.dart';
import 'package:meta/meta.dart';
import 'package:valentino/ui/basket_page/data/models.dart';
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

    on<ClearBasketEvent>((event, emit) {
      positions.clear();
      totalCost = 0.0;
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost));
    });

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

  Future<CreateOrderStatus> createOrder(
      {required AddressData addressData,
      required UserData user,
      required OrderServiceType orderServiceType,
      required String comment}) async {
    List<PositionHttpModel> itemsHttp = [];
    for (int i = 0; i < positions.length; i++) {
      itemsHttp.add(PositionHttpModel(
          amount: positions[i].count,
          modifiers: [],
          productId: positions[i].dish!.id));
    }
    AddressHttpModel addressHttpModel = AddressHttpModel(
        doorphone: addressData.doorphone,
        entrance: addressData.entrance,
        flat: addressData.flat,
        floor: addressData.floor,
        house: addressData.house,
        street: addressData.street);

    OrderHttpModel orderHttpModel = OrderHttpModel(
        type_order: orderServiceType,
        phone: user.username,
        items: itemsHttp,
        adress: addressHttpModel,
        comment: comment,
        summa: getTotalCost() + addressData.deliveryCost,
        type_payment: PaymentType.Cash);

    CreateOrderStatus orderStatus =
        await OrderRepository().createOrder(orderHttpModel, user.accessToken);
    return orderStatus;
  }
}
