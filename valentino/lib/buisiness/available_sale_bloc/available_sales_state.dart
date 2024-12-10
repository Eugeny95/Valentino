part of 'available_sales_bloc.dart';

enum AvailableSalesStatus { initial, done, error }

class AvailableSalesState {
  AvailableSalesStatus availableSalesStatus;
  AvailableSalesHttpModel? availableSalesHttpModel;
  AvailableSalesState(
      {required this.availableSalesStatus, this.availableSalesHttpModel});
}
