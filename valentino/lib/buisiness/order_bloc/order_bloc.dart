import 'package:bloc/bloc.dart';
import 'package:data_layer/models/http_models/order_http_model.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState(status: OrderStatus.initial)) {
    on<OrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
