part of 'location_bloc.dart';

class LocationsState {
  final List<Location>? locationsList;
  final Location? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;

  LocationsState({this.locationsList, this.searchResult, this.queryParameters, this.isActiveSearch});

  LocationsState copywith({
    List<Location>? characterList,
    Location? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
  }) => LocationsState(
    locationsList: characterList ?? this.locationsList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch) ;
  
}

