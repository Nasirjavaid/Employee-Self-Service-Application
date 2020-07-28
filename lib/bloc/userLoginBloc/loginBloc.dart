import 'package:bloc/bloc.dart';
import 'package:ess_application/bloc/userAuthBloc/userAuthBloc.dart';
import 'package:ess_application/bloc/userAuthBloc/userAuthEvent.dart';

import 'package:ess_application/bloc/userLoginBloc/loginState.dart';

import 'package:ess_application/config/methods.dart';
import 'package:ess_application/model/userLogin.dart';
import 'package:ess_application/repository/userAuthRepository.dart';
import 'package:flutter/cupertino.dart';

import 'loginEvent.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with ValidationMixin {

  //Repositiry to get User inforation
  final UserAuthRepository userAuthRepository;
  //User Auth block refrence to talk Bloc to Bloc
  final UserAuthBloc userAuthBloc;

  LoginBloc({@required this.userAuthRepository, @required this.userAuthBloc})
      : assert(userAuthRepository != null),
        assert(userAuthBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(event) async* {
    if (event is LoginButtonPressed) {
      yield LoginInProgress();

      if (this.isFieldEmpty(event.userName)) {
        yield LoginFailure(error: "Please enter User Name");
        return;
      } else if (!this.validateEmailAddress(event.userName)) {
        yield LoginFailure(error: "Please enter valid User Name");
        return;
      } else if (this.isFieldEmpty(event.password)) {
        yield LoginFailure(error: "Please enter password");
        return;
      } else if (!this.validatePassword(event.password)) {
        yield LoginFailure(error: "Please enter valid password");
        return;
      } else {
        try {
          final UserLogin userLogin = await userAuthRepository.authenticate(
              username: event.userName, password: event.password);
          userAuthBloc.add(AuthLoggedIn(userLogin: userLogin));

          yield LoginInitial();
        } catch (error) {
          yield LoginFailure(error: error.toString());
        }
      }
    }
  }
}
