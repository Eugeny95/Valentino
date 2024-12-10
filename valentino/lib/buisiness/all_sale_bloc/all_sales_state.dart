part of 'all_sales_bloc.dart';

enum AllSalesStatus { initial, done, error }

class AllSalesState {
  AllSalesStatus allSalesStatus;
  AllSalesHttpModel? allSalesHttpModel;
  AllSalesState({required this.allSalesStatus, this.allSalesHttpModel});
}
