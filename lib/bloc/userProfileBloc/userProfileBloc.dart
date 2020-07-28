import 'package:ess_application/bloc/userProfileBloc/userProfileEvent.dart';
import 'package:ess_application/bloc/userProfileBloc/userProfileState.dart';
import 'package:ess_application/model/userLogin.dart';
import 'package:ess_application/repository/userProfileRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  @override
  UserProfileState get initialState => UserProfileInitiateData();

  final UserProfileRepository userProfileRepository;

  UserProfileBloc({@required this.userProfileRepository})
      : assert(userProfileRepository != null);

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is UserProfileEventStartDataObtaining) {
      //initial state when loading data
      yield UserProfileInProgressDatatObtaining();
      //waiting for 1 second to create proper view
      await Future.delayed(Duration(seconds: 1));
      //getting data from User repository
      UserLogin userLogin = await userProfileRepository.getUserInormation();
      print("Useer data in User Bloc by user repository ${userLogin.empName}");
      //checking if any value is null
      if (!userLogin.checkIfAnyIsNull()) {
        //if successfull then return data to User profile screen
        yield UserProfilSuccessfullyDataObtained(userLogin: userLogin);
      } else {
        //if un successfull then return the error message
        yield UserProfilFaileldToObtaineData(error: "Failed to load User data");
      }
    }
  }
}
