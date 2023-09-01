import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/domine/entities/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationsState> {
  LocationBloc() : super(LocationsState()) {
    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
