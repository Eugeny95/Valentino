part of 'all_sales_bloc.dart';

@immutable
sealed class AllSalesEvent {}

class GetAllSalesEvent extends AllSalesEvent {
  String accessToken;
  GetAllSalesEvent({required this.accessToken});
}
