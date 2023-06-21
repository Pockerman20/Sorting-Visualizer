import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sortingvisualizer/bloc/input_bloc/events/input_event.dart';
import 'package:sortingvisualizer/bloc/input_bloc/states/input_state.dart';

export '../input_bloc/events/input_event.dart';
export '../input_bloc/states/input_state.dart';

class InputBloc extends Bloc<AbstractInputEvent, AbstractInputState> {
  String _bars = "100";

  InputBloc() : super(InitialInputState()) {
    on<DigitInputEvent>((event, emit) {
      if (_bars.isEmpty && event.digit == "0") {
        emit(CorrectInputState(bars: ""));
      } else if (int.parse(_bars + event.digit) > 1000) {
        emit(ErrorInputState(bars: _bars, error: "Maximum number is 1000"));
      } else {
        _bars += event.digit;
        emit(CorrectInputState(bars: _bars));
      }
    });

    on<BackspaceInputEvent>((event, emit) {
      if (_bars.length > 1) {
        _bars = _bars.substring(0, _bars.length - 1);
      } else {
        _bars = "";
      }

      emit(CorrectInputState(bars: _bars));
    });

    on<VisualizedInputEvent>((event, emit) {
      if (_bars.isEmpty) {
        emit(ErrorInputState(bars: _bars, error: "Please enter bar count"));
      } else if (int.parse(_bars) < 2) {
        emit(ErrorInputState(bars: _bars, error: "Minimum number is 2"));
      } else {
        emit(VisualizeInputState(bars: _bars));
      }
    });
  }
}
