import 'package:bloc/bloc.dart';
import 'package:data_layer/models/http_models/available_sales_http_model.dart';
import 'package:data_layer/network/available_sales_repository.dart';
import 'package:flutter/material.dart';

part 'available_sales_event.dart';
part 'available_sales_state.dart';

class AvailableSalesBloc
    extends Bloc<AvailableSalesEvent, AvailableSalesState> {
  AvailableSalesBloc()
      : super(AvailableSalesState(
            availableSalesStatus: AvailableSalesStatus.initial)) {
    on<GetAvailableSalesEvent>((event, emit) async {
      AvailableSalesHttpModel availableSalesHttpModel;

      AvailableSalesState availableSalesState;
      print('% getting asction');
      try {
        availableSalesHttpModel =
            await AvailableSalesRepository().getCachedAvailableSales();

        availableSalesState = AvailableSalesState(
            availableSalesStatus: AvailableSalesStatus.done);
        availableSalesState.availableSalesHttpModel = availableSalesHttpModel;

        // print(availableSalesHttpModel);
        // emit(allSalesState);
      } catch (_) {
        print('% $_');
      }
      availableSalesHttpModel = await AvailableSalesRepository()
          .syncAvailableSales(accessToken: event.accessToken);
      availableSalesState =
          AvailableSalesState(availableSalesStatus: AvailableSalesStatus.done);
      availableSalesState.availableSalesHttpModel = availableSalesHttpModel;
      for (var sale in availableSalesHttpModel.available_actions ?? []) {
        print('%' + sale.toString());
      }

      emit(availableSalesState);
    });
  }
}
