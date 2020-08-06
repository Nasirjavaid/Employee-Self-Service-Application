import 'package:equatable/equatable.dart';
import 'package:ess_application/model/leaveSummary.dart';


abstract class LeaveSummaryState extends Equatable {
  const LeaveSummaryState();

  @override
  List<Object> get props => [];
}

class LeaveSummaryInProgressState extends LeaveSummaryState{}

class LeaveSummaryInitialState extends LeaveSummaryState {}

class LeaveSummaryFailureState extends LeaveSummaryState {}

class LeaveSummarySuccessState extends LeaveSummaryState {


  final List<LeaveSummary> leaveSummaryList;
  final bool hasReachedMax;

  const LeaveSummarySuccessState({this.leaveSummaryList, this.hasReachedMax});

  LeaveSummarySuccessState copyWith(
      {List<LeaveSummary> leaveSummaryList, bool hasReachedMax}) {

    return LeaveSummarySuccessState(

        leaveSummaryList: leaveSummaryList ?? this.leaveSummaryList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [leaveSummaryList, hasReachedMax];

  @override
  String toString() =>
      'LeaveSummaryListSuccessState : ${leaveSummaryList.length}, hasReachedMax : $hasReachedMax';
}
