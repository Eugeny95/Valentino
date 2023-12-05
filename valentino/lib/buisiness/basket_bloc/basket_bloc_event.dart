part of 'basket_bloc_bloc.dart';

@immutable
sealed class BasketEvent {}

class EmptyBasketEvent extends BasketEvent{}


class AddDishEvent extends BasketEvent{
DishHttpModel? dishHttpModel;
AddDishEvent({required this.dishHttpModel});

}