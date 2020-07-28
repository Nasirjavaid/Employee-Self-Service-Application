import 'package:equatable/equatable.dart';
import 'package:ess_application/model/salarySlip.dart';

abstract class SalarySlipState extends Equatable {
  const SalarySlipState();

  @override
  List<Object> get props => [];
}

class SalarySlipInitialState extends SalarySlipState {}

class SalarySlipFailureState extends SalarySlipState {}

class SalarySlipSuccessState extends SalarySlipState {
  final List<SalarySlip> salarySlipList;
  final bool hasReachedMax;

  const SalarySlipSuccessState({this.salarySlipList, this.hasReachedMax});

  SalarySlipSuccessState copyWith(
      {List<SalarySlip> salarySlipList, bool hasReachedMax}) {

    return SalarySlipSuccessState(

        salarySlipList: salarySlipList ?? this.salarySlipList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [salarySlipList, hasReachedMax];

  @override
  String toString() =>
      'SalalrySlipScccessState : ${salarySlipList.length}, hasReachedMax : $hasReachedMax';
}
