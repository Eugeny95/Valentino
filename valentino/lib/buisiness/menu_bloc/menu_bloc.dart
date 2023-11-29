import 'package:bloc/bloc.dart';
import 'package:data_layer/models/menu_http_model.dart';
import 'package:data_layer/network/menu_repository.dart';
import 'package:meta/meta.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuState(menuStatus: MenuStatus.initial)) {
    on<MenuEvent>((event, emit)async {

      MenuHttpModel menuHttpModel = await MenuRepository().getMenu();
      MenuState menuState = MenuState(menuStatus: MenuStatus.done);
      menuState.menuHttpModel = menuHttpModel;
     print(menuHttpModel.menu!.length);
    //  print (menuHttpModel);
     emit(menuState);
     // emit();
      // TODO: implement event handler
    });
  }
}
