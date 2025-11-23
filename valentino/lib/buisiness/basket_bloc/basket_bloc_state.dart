part of 'basket_bloc_bloc.dart';

enum BasketStatus { initial, done, error }

enum SaleStatus { initial, done, error }

class Position {
  double allCost = 0.0;
  int count = 1;
  DishHttpModel? dish;
  Position({required this.dish, required this.count});

  double calculateCost() {
    allCost = dish!.currentPrice! * count;
    return allCost;
  }
}

class BasketState {
  BasketStatus basketStatus;
  List<Position>? positions;
  double? totalCost = 0;
  double? summaFromserver;
  String? deliveryFromserver;
  String? saleFromserver;

  BasketState(
      {required this.basketStatus,
      this.positions,
      this.totalCost,
      this.summaFromserver,
      this.deliveryFromserver,
      this.saleFromserver});
}
