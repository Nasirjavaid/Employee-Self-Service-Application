import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}
//login nitial state
class LoginInitial extends LoginState {}
//login in progress
class LoginInProgress extends LoginState {}
//on any type of log in error 
class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({@required this.error});

  @override
  String toString() => 'LoginFailure{error": $error}';
}
