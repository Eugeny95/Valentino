import 'package:auth_feature/data/auth_data.dart';
import 'package:bloc/bloc.dart';
import 'package:data_layer/models/http_models/address_http_model.dart';
import 'package:data_layer/models/http_models/dish_http_model.dart';
import 'package:data_layer/models/http_models/order_http_model.dart';
import 'package:data_layer/models/http_models/point_http_model.dart';
import 'package:data_layer/models/http_models/position_http_model.dart';
import 'package:data_layer/models/http_models/pre_order_http_model.dart';

import 'package:data_layer/network/order_repository.dart';
import 'package:meta/meta.dart';
import 'package:valentino/ui/basket_page/data/models.dart';
part 'basket_bloc_event.dart';
part 'basket_bloc_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  List<Position> positions = [];
  double totalCost = 0;
  double deliveryCost = 0;
  OrderServiceType orderServiceType = OrderServiceType.DeliveryPickUp;

  BasketBloc() : super(BasketState(basketStatus: BasketStatus.initial)) {
    Future<double> getServerCost(
        {required AddressData addressData,
        required PointData pointData,
        required UserData user,
        required OrderServiceType orderServiceType,
        required PaymentType paymentType,
        required int saleId,
        required String promo}) async {
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
      PointHttpModel pointHttpModel = PointHttpModel(
        x: pointData.x,
        y: pointData.y,
      );

      PreOrderHttpModel preOrderHttpModel = PreOrderHttpModel(
          type_order: orderServiceType,
          phone: user.username,
          items: itemsHttp,
          adress: addressHttpModel,
          point: pointHttpModel,
          sale: saleId,
          promo: promo,
          summa: totalCost + addressData.deliveryCost,
          type_payment: paymentType);

      double summaFromserver = await OrderRepository()
          .calculateSumInServer(preOrderHttpModel, user.accessToken);

      return summaFromserver;
    }

    on<AddDishEvent>((event, emit) async {
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
      double summaFromserver = await getServerCost(
          addressData: event.addressData!,
          pointData: event.pointData!,
          user: event.user!,
          orderServiceType: event.orderServiceType!,
          paymentType: event.paymentType!,
          saleId: event.saleId!,
          promo: event.promo!);
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost,
          summaFromserver: summaFromserver));
    });

    on<ClearBasketEvent>((event, emit) {
      positions.clear();
      totalCost = 0.0;
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost));
    });

    on<RemoveDishEvent>((event, emit) async {
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
      double summaFromserver = await getServerCost(
          addressData: event.addressData!,
          pointData: event.pointData!,
          user: event.user!,
          orderServiceType: event.orderServiceType!,
          paymentType: event.paymentType!,
          saleId: event.saleId!,
          promo: event.promo!);
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost,
          summaFromserver: summaFromserver));
    });

    on<SetDeliveryCost>((event, emit) async {
      deliveryCost = event.deliveryCost;
      totalCost = 0;
      for (Position position in positions) {
        totalCost = totalCost + position!.calculateCost();
      }
      double summaFromserver = await getServerCost(
          addressData: event.addressData!,
          pointData: event.pointData!,
          user: event.user!,
          orderServiceType: event.orderServiceType!,
          paymentType: event.paymentType!,
          saleId: event.saleId!,
          promo: event.promo!);

      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost,
          summaFromserver: summaFromserver));
    });

    on<RemovePositionEvent>((event, emit) async {
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
      double summaFromserver = await getServerCost(
          addressData: event.addressData!,
          pointData: event.pointData!,
          user: event.user!,
          orderServiceType: event.orderServiceType!,
          paymentType: event.paymentType!,
          saleId: event.saleId!,
          promo: event.promo!);
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost,
          summaFromserver: summaFromserver));
    });

    on<GetBasketPositions>((event, emit) {
      print('get basket positions');
      totalCost = 0;
      for (Position position in positions) {
        totalCost = totalCost + position.allCost;
      }
      //  double summaFromserver = await getServerCost(addressData: event.addressData!, user: event.user!, orderServiceType: event.orderServiceType!, paymentType: event.paymentType!, saleId: event.saleId!);
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost));
      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost));
    });
    on<SelectDeliveryTypeEvent>((event, emit) async {
      double summaFromserver = await getServerCost(
          addressData: event.addressData!,
          pointData: event.pointData!,
          user: event.user!,
          orderServiceType: event.orderServiceType!,
          paymentType: event.paymentType!,
          saleId: event.saleId!,
          promo: event.promo!);

      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost,
          summaFromserver: summaFromserver));
      print('summaFromServVBloke = ${summaFromserver}');
    });

    on<SlectSaleEvent>((event, emit) async {
      double summaFromserver = await getServerCost(
          addressData: event.addressData!,
          pointData: event.pointData!,
          user: event.user!,
          orderServiceType: event.orderServiceType!,
          paymentType: event.paymentType!,
          saleId: event.saleId!,
          promo: event.promo!);

      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost,
          summaFromserver: summaFromserver));
      print('summaFromServVBloke = ${summaFromserver}');
    });
    on<PromoEvent>((event, emit) async {
      double summaFromserver = await getServerCost(
          addressData: event.addressData!,
          pointData: event.pointData!,
          user: event.user!,
          orderServiceType: event.orderServiceType!,
          paymentType: event.paymentType!,
          saleId: event.saleId!,
          promo: event.promo!);

      emit(BasketState(
          basketStatus: BasketStatus.done,
          positions: positions,
          totalCost: totalCost + deliveryCost,
          summaFromserver: summaFromserver));
      print('summaFromServVBloke = ${summaFromserver}');
    });
  }

  double getTotalCost() {
    return totalCost + deliveryCost;
  }

  OrderServiceType getOrderServiceType() {
    return orderServiceType;
  }

  List<Position> getPositions() {
    return positions;
  }

  Future<CreateOrderStatus> createOrder(
      {required AddressData addressData,
      required UserData user,
      required double summaRub,
      required int saleId,
      required OrderServiceType orderServiceType,
      required PaymentType paymentType,
      required DateTime completeBefore,
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
        completeBefore: completeBefore,
        comment: comment,
        summa: summaRub,
        sale: saleId,
        type_payment: paymentType);

    CreateOrderStatus orderStatus =
        await OrderRepository().createOrder(orderHttpModel, user.accessToken);

    return orderStatus;
  }
}
