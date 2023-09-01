part of 'location_bloc.dart';

class LocationsState extends Equatable{
  final List<Location>? locationsList;
  final Location? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;

  LocationsState({this.locationsList, this.searchResult, this.queryParameters, this.isActiveSearch});

  LocationsState copywith({
    List<Location>? locationsList,
    Location? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
  }) => LocationsState(
    locationsList: locationsList ?? this.locationsList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch) ;
    
      @override
      List<Object?> get props => [locationsList, searchResult, queryParameters, isActiveSearch];
  
}

