import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:ess_application/model/leaveBalance.dart';

abstract class LeaveBalanceState extends Equatable {
  const LeaveBalanceState();

  @override
  List<Object> get props => [];
}

//leave balance initial state
class LeaveBalanceInitialState extends LeaveBalanceState {}

// leave balance state in progress
class LeaveBalanceInProgresslState extends LeaveBalanceState {}

//leave balance successful state
class LeaveBalanceSuccessFulState extends LeaveBalanceState {
  final LeaveBalance leaveBalance;

  LeaveBalanceSuccessFulState({@required this.leaveBalance});
}

//leave balance failure state
class LeaveBalanceFailureState extends LeaveBalanceState {
  final String error;

  const LeaveBalanceFailureState({@required this.error});

  @override
  String toString() => 'leaveBalanceFailure{error": $error}';
}
