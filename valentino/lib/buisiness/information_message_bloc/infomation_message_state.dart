part of 'infomation_message_bloc.dart';

enum InformationMessageStatus { initial, done, error }

class InformationMessageState {
  InformationMessageStatus informationMessageStatus;
  InformationMessageHttpModel? informationMessageHttpModel;
  InformationMessageState(
      {required this.informationMessageStatus,
      this.informationMessageHttpModel});
}
