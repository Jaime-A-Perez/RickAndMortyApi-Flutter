import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/domine/entities/character.dart';
import 'package:rick_and_morty/domine/entities/location.dart';
import 'package:rick_and_morty/infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';

import '../../utils/utils.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationsState> {
  LocationBloc() : super(const LocationsState()) {
    on<InitLocationBloc>((event, emit) async{
      final List<Location> locations = await DataSourceImpRickAndMorty().getLocation(1);
      emit(state.copywith(locationsList: locations));
    });

    on<AddResidents>((event, emit) async{
      final List<int> listIdResidents = extractIdsFromUrls(event.listResidents);
      final List<Character> residents = await DataSourceImpRickAndMorty().getResidents(listIdResidents);
      emit(state.copywith(residents: residents));
    });
    
    on<AddNextPageOfLocationBloc>((event, emit) async{
      final List<Location> location = await DataSourceImpRickAndMorty().getLocation(event.currentPage);
      emit(state.copywith(locationsList: [...state.locationsList!, ...location], currentPage: event.currentPage));
    });
    
    on<IsRequeringData>((event, emit) async{                
      emit(state.copywith(isRequeringData: event.isRequeringData));
    });
  }
}
