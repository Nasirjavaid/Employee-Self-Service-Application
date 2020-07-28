import 'package:equatable/equatable.dart';


import 'package:ess_application/model/userLogin.dart';
import 'package:meta/meta.dart';

abstract class UserProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

//initial state
class UserProfileInitiateData extends UserProfileState {}

//Success state
class UserProfilSuccessfullyDataObtained extends UserProfileState {
  UserLogin userLogin;

  @override 
  List<Object> get props => [userLogin];

 

  UserProfilSuccessfullyDataObtained({@required this.userLogin});
}

//failure state
class UserProfilFaileldToObtaineData extends UserProfileState {
  String error;
  UserProfilFaileldToObtaineData({@required this.error});
}

//in progress state
class UserProfileInProgressDatatObtaining extends UserProfileState {}
