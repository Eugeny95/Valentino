// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

class OrderEvent {}

class CreateOrderEvent extends OrderEvent {
  OrderHttpModel orderHttpModel;
  CreateOrderEvent({
    required this.orderHttpModel,
  });
}
