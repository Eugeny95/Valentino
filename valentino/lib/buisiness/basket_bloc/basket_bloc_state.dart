part of 'basket_bloc_bloc.dart';

enum BasketStatus { initial, done, error }

class BasketState {
  BasketStatus basketStatus;
  
  BasketState({required this.basketStatus});
}
