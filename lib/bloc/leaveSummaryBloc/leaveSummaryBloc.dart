import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ess_application/bloc/leaveSummaryBloc/leaveSummaryState.dart';
import 'package:ess_application/bloc/leaveSummaryBloc/leaveSummaryEvent.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:ess_application/repository/leaveSummaryRepository.dart';

class LeaveSummaryBloc extends Bloc<LeaveSummaryEvent, LeaveSummaryState> {
  LeaveSummaryRepository leaveSummaryRepository;
  LeaveSummaryBloc({@required this.leaveSummaryRepository});
  @override
  LeaveSummaryState get initialState => LeaveSummaryInitialState();

// Note: Overriding transform allows us to transform the Stream before mapEventToState is called.
// This allows for operations like distinct(), debounceTime(), etc... to be applied.
//Using rx DART library for this purpose
  @override
  Stream<Transition<LeaveSummaryEvent, LeaveSummaryState>> transformEvents(
      Stream<LeaveSummaryEvent> events,
      TransitionFunction<LeaveSummaryEvent, LeaveSummaryState> transitionFn) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<LeaveSummaryState> mapEventToState(LeaveSummaryEvent event) async* {
    final currentState = state;

    if (currentState is LeaveSummaryFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is LeaveSummaryInitialState) {
          final leaveSummaryList =
              await leaveSummaryRepository.getLeaveSummary(0, 20);

          yield LeaveSummarySuccessState(
              leaveSummaryList: leaveSummaryList, hasReachedMax: false);

          return;
        }

        // if current state is success then get next 20 results and add into the previous list

        if (currentState is LeaveSummarySuccessState) {
          final leaveSummaryList = await leaveSummaryRepository.getLeaveSummary(
              currentState.leaveSummaryList.length, 20);

          yield leaveSummaryList.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : LeaveSummarySuccessState(
                  leaveSummaryList:
                      currentState.leaveSummaryList + leaveSummaryList,
                  hasReachedMax: false);
        }
      } catch (_) {
        yield LeaveSummaryFailureState();
      }
    }
  }

  bool _hasReachedMax(LeaveSummaryState state) =>
      state is LeaveSummarySuccessState && state.hasReachedMax;
}
