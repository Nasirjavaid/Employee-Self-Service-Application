import 'package:equatable/equatable.dart';

abstract class SalarySlipEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SalarySlipFetched extends SalarySlipEvent {}