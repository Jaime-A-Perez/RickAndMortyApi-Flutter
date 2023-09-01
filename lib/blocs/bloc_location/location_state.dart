part of 'location_bloc.dart';

class LocationsState extends Equatable{
  final List<Location>? locationsList;
  final Location? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;
  final List<Character>? residents;

  LocationsState({this.locationsList, this.searchResult, this.queryParameters, this.isActiveSearch, this.residents}); 

  

  LocationsState copywith({
    List<Location>? locationsList,
    Location? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
    List<Character>? residents
  }) => LocationsState(
    locationsList: locationsList ?? this.locationsList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch,
    residents: residents ?? this.residents);
    
      @override
      List<Object?> get props => [locationsList, searchResult, queryParameters, isActiveSearch, residents];
  
}

