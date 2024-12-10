import 'package:bloc/bloc.dart';
import 'package:data_layer/models/http_models/information_message_http_model.dart';
import 'package:data_layer/network/information_message_repository.dart';
import 'package:flutter/material.dart';

part 'infomation_message_event.dart';
part 'infomation_message_state.dart';

class InformationMessageBloc
    extends Bloc<InformationMessageEvent, InformationMessageState> {
  InformationMessageBloc()
      : super(InformationMessageState(
            informationMessageStatus: InformationMessageStatus.initial)) {
    on<InformationMessageEvent>((event, emit) async {
      InformationMessageHttpModel informationMessageHttpModel;
      InformationMessageState informationMessageState;

      informationMessageHttpModel =
          await InformationMessageRepository().syncInformationMessage();
      informationMessageState = InformationMessageState(
          informationMessageStatus: InformationMessageStatus.done);
      informationMessageState.informationMessageHttpModel =
          informationMessageHttpModel;
      //  print (InformationMessageHttpModel);
      emit(informationMessageState);
      // emit();
      // TODO: implement event handler
    });
  }
}
