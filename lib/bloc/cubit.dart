import 'package:bloc_counter/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit(super.initialState);

  int counter = 1;

  static CounterCubit get(context) => BlocProvider.of(context);

  void minus() {
    counter--;
    emit(MinusState());
  }

  void plus() {
    counter++;
    emit(PlusState());
  }
}
