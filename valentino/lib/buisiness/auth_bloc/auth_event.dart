// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  String username;
  String password;
  LoginEvent({
    required this.username,
    required this.password,
  });
}

class RegisterEvent extends AuthEvent {
  String username;
  String password;
  String email;
  String first_name;
  String last_name;
  DateTime date_birth;
  RegisterEvent({
    required this.username,
    required this.password,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.date_birth,
  });
}

class GetUserEvent extends AuthEvent {}
