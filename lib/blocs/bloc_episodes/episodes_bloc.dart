import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(EpisodesInitial()) {
    on<EpisodesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}