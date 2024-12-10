part of 'available_sales_bloc.dart';

@immutable
sealed class AvailableSalesEvent {}

class GetAvailableSalesEvent extends AvailableSalesEvent {
  String accessToken;
  GetAvailableSalesEvent({required this.accessToken});
}
