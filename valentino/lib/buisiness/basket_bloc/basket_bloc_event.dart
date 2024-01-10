part of 'basket_bloc_bloc.dart';

@immutable
sealed class BasketEvent {}

class EmptyBasketEvent extends BasketEvent {}

class AddDishEvent extends BasketEvent {
  DishHttpModel? dishHttpModel;
  AddDishEvent({required this.dishHttpModel});
}

class RemoveDishEvent extends BasketEvent {
  String dishId;
  RemoveDishEvent({required this.dishId});
}

class RemovePositionEvent extends BasketEvent {
  String dishId;
  RemovePositionEvent({required this.dishId});
}

class GetBasketPositions extends BasketEvent {}
