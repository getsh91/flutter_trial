// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';

// enum CounterEvent { increment, decrement }

// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0);
//   @override
//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//       case CounterEvent.decrement:
//         yield state - 1;
//         break;
//     }
//     throw UnimplementedError();
//   }
// }

// Future<void> main(List<String> args) async {
//   final bloc = CounterBloc();
//   final streamSubscription = bloc.listen(print);
//   bloc.add(CounterEvent.increment);
//   await Future.delayed(Duration.zero);
//   await streamSubscription.cancel();
//   await bloc.close();
// }
