import 'package:ess_application/bloc/salarySlipBloc/salarySlipEvent.dart';
import 'package:ess_application/bloc/salarySlipBloc/salarySlipState.dart';
import 'package:ess_application/repository/salalrySlipRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class SalarySlipBloc extends Bloc<SalarySlipEvent, SalarySlipState> {
  SalarySlipRepository salarySlipRepository;

  SalarySlipBloc({@required this.salarySlipRepository});

  @override
  SalarySlipState get initialState => SalarySlipInitialState();


// Note: Overriding transform allows us to transform the Stream before mapEventToState is called. 
// This allows for operations like distinct(), debounceTime(), etc... to be applied.
//Using rx DART library for this purpose
@override
Stream<Transition<SalarySlipEvent,SalarySlipState>> transformEvents(

   Stream<SalarySlipEvent> events,
   TransitionFunction<SalarySlipEvent,SalarySlipState> transitionFn
){

   return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
}



  @override
  Stream<SalarySlipState> mapEventToState(SalarySlipEvent event) async* {
    final currentState = state;

    if (event is SalarySlipFetched && !_hasReachedMax(currentState)) {
      try {
        // if state is initial state then get first 20 records
        if (currentState is SalarySlipInitialState) {
          final salalrySlipList =
              await salarySlipRepository.getSalalrySlips(0, 20);

          yield SalarySlipSuccessState(
              salarySlipList: salalrySlipList, hasReachedMax: false);

          return;
        }

// if current state is success then get next 20 results and add into the previous list 
        if (currentState is SalarySlipSuccessState) {
          final salarySlipList = await salarySlipRepository.getSalalrySlips(
              currentState.salarySlipList.length, 20);

          yield salarySlipList.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : SalarySlipSuccessState(
                  salarySlipList: currentState.salarySlipList + salarySlipList,
                  hasReachedMax: false);
        }
      } catch (_) {
        yield SalarySlipFailureState();
      }
    }
  }

  bool _hasReachedMax(SalarySlipState state) =>
      state is SalarySlipSuccessState && state.hasReachedMax;
}
