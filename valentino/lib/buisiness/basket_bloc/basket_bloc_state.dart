part of 'basket_bloc_bloc.dart';

enum BasketStatus { initial, done, error }

class Position {
  double allCost = 0.0;
  int count = 1;
  DishHttpModel? dish;
  Position({required this.dish, required this.count});
}

class BasketState {
  BasketStatus basketStatus;
  List<Position>? positions;

  BasketState({required this.basketStatus, this.positions});
}
