import 'package:equatable/equatable.dart';

abstract class LeaveSummaryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LeaveSummaryFetched extends LeaveSummaryEvent {}