import 'package:auth_feature/auth_feature.dart';
import 'package:auth_feature/data/auth_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService = AuthService();
  AuthStatus authStatus = AuthStatus.unauthorized;

  void init() async {
    authStatus = await authService.logIn(
        username: '',
        password: '',
        cloudMessageToken: '',
        deviceType: '',
        authUrl: '');
  }

  bool isAuth() {
    if (authStatus == AuthStatus.authorized &&
        authService.user.accessToken != '') {
      return true;
    } else {
      return false;
    }
  }

  String getAccessToken() {
    return authService.user.accessToken;
  }

  AuthBloc() : super(AuthState(status: AuthStatus.initial)) {
    on<LoginEvent>((event, emit) async {
      authStatus = await authService.logIn(
          cloudMessageToken: '',
          deviceType: '',
          username: event.username,
          password: event.password,
          authUrl: 'http://91.222.236.176:8880/auth/login/');
      emit(AuthState(status: authStatus, user: authService.user));
    });

    on<GetUserEvent>((event, emit) async {
      if (isAuth()) {
        emit(AuthState(status: authStatus, user: authService.user));
      } else {
        emit(
            AuthState(status: AuthStatus.unauthorized, user: authService.user));
      }
    });
    on<RegisterEvent>((event, emit) async {
      UserData userData = UserData();
      userData.username = event.username;
      userData.password = event.password;
      userData.email = event.email;
      userData.date_birth = event.date_birth;
      userData.first_name = event.first_name;
      userData.last_name = event.last_name;

      authStatus = await authService.register(
          user: userData,
          registerUrl: 'http://91.222.236.176:8880/auth/register/');
      emit(AuthState(status: authStatus, user: authService.user));
    });
  }
}
