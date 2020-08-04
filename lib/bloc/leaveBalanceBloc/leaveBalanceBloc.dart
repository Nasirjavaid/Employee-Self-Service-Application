import 'package:ess_application/bloc/leaveBalanceBloc/leaveBalanceEvent.dart';
import 'package:ess_application/bloc/leaveBalanceBloc/leaveBalanceState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ess_application/model/leaveBalance.dart';
import 'package:ess_application/repository/leaveBalanceRepository.dart';

class LeaveBalanceBloc extends Bloc<LeaveBalanceEvent, LeaveBalanceState> {
  @override
  get initialState => LeaveBalanceInitialState();

  LeaveBalanceRepository leaveBlanceRepository;
  LeaveBalance leaveBalance = LeaveBalance();
  LeaveBalanceBloc({@required this.leaveBlanceRepository});

  @override
  Stream<LeaveBalanceState> mapEventToState(LeaveBalanceEvent event) async* {
    if (event is LeaveBalanceFetchDataEvent) {
      yield LeaveBalanceInProgresslState();

      leaveBalance = await leaveBlanceRepository.geLeaveBalance();

      if (leaveBalance.id != null) {
        yield LeaveBalanceSuccessFulState(leaveBalance: leaveBalance);
      } else {
        yield LeaveBalanceFailureState(
            error: "Failed to fetch Leave Balance data");
      }
    }
  }
}
