import 'package:auth_feature/data/auth_data.dart';
import 'package:bloc/bloc.dart';
import 'package:data_layer/models/http_models/all_sales_http_model.dart';
import 'package:data_layer/network/all_sales_repository.dart';
import 'package:flutter/material.dart';

part 'all_sales_event.dart';
part 'all_sales_state.dart';

class AllSalesBloc extends Bloc<AllSalesEvent, AllSalesState> {
  AllSalesBloc()
      : super(AllSalesState(allSalesStatus: AllSalesStatus.initial)) {
    on<GetAllSalesEvent>((event, emit) async {
      AllSalesHttpModel allSalesHttpModel;

      AllSalesState allSalesState;
      // print('% getting asction');
      try {
        allSalesHttpModel = await AllSalesRepository().getCachedAllSales();

        allSalesState = AllSalesState(allSalesStatus: AllSalesStatus.done);
        allSalesState.allSalesHttpModel = allSalesHttpModel;

        // print(allSalesHttpModel);
        // emit(allSalesState);
      } catch (_) {
        // print('% $_');
      }
      allSalesHttpModel = await AllSalesRepository()
          .syncAllSales(accessToken: event.accessToken);
      allSalesState = AllSalesState(allSalesStatus: AllSalesStatus.done);
      allSalesState.allSalesHttpModel = allSalesHttpModel;
      for (var sale in allSalesHttpModel.all_actions ?? []) {
        // print('%' + sale.toString());
      }

      emit(allSalesState);
    });
  }
}
