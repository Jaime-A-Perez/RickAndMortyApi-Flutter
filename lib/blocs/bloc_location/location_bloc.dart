import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/domine/entities/location.dart';
import 'package:rick_and_morty/infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationsState> {
  LocationBloc() : super(LocationsState()) {
    on<InitLocationBloc>((event, emit) async{
      final List<Location> locations = await DataSourceImpRickAndMorty().getLocation(1);
      emit(state.copywith(locationsList: locations));
    });
  }
}
