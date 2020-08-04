import 'package:equatable/equatable.dart';


abstract class LeaveBalanceEvent extends Equatable {
  const LeaveBalanceEvent();
    @override
  List<Object> get props => [];
}

//initial event to get Leave balance : we will fire this event from User interface
class LeaveBalanceFetchDataEvent extends LeaveBalanceEvent{}
