// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

enum OrderStatus { initial, suress }

class OrderState {
  OrderStatus status;
  OrderState({
    required this.status,
  });
}
