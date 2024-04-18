library auth_feature;

import 'dart:async';
import 'package:auth_feature/data/auth_repository.dart';
import 'package:auth_feature/data/auth_data.dart';

class AuthService {
  UserData user = UserData();

  Future<UserData> loginOffline() async {
    return await getUserData();
  }

  Future<UserData> loginOnline(
      {required String message_service_token,
      required String deviceType,
      required String username,
      required String password,
      required String authUrl}) async {
    return await loginInServer(
        message_service_token: message_service_token,
        deviceType: deviceType,
        username: username,
        password: password,
        authUrl: authUrl);
  }

  Future<AuthStatus> logIn(
      {required String username,
      required String password,
      required String cloudMessageToken,
      required String deviceType,
      required String authUrl}) async {
    if (username == '' || password == '') {
      try {
        user = await loginOffline();
      } catch (_) {}
      if (user.accessToken.isEmpty) {
        user.authStatus = AuthStatus.authorized;
        return AuthStatus.unauthorized;
      } else {
        return AuthStatus.authorized;
      }
    }

    user = await loginOnline(
        message_service_token: cloudMessageToken,
        deviceType: deviceType,
        username: username,
        password: password,
        authUrl: authUrl);

    switch (user.authStatus) {
      case (AuthStatus.authorized):
        {
          try {
            await setUserData(user);
          } catch (_) {}
          return AuthStatus.authorized;
        }
      case (AuthStatus.network_failure):
        return AuthStatus.network_failure;
      case (AuthStatus.user_not_found):
        return AuthStatus.user_not_found;
      default:
        return AuthStatus.unauthorized;
    }
  }

  Future<void> logOut() async {
    user = UserData();
    await deleteUserData();
  }

  Future<AuthStatus> register(
      {required UserData userData, required String registerUrl}) async {
    user = await registerInServer(userData, registerUrl);
    print('auth feature = ${user.first_name}');
    //print(userData.authStatus);

    switch (user.authStatus) {
      case (AuthStatus.authorized):
        {
          try {
            await setUserData(user);

            return AuthStatus.authorized;
          } catch (_) {
            print('exeption on setting user data $_');
          }
          return AuthStatus.authorized;
        }
      case (AuthStatus.network_failure):
        return AuthStatus.network_failure;
      case (AuthStatus.user_exist):
        return AuthStatus.user_exist;
      default:
        return AuthStatus.unauthorized;
    }
  }
}
