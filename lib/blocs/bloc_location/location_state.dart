part of 'location_bloc.dart';

class LocationsState extends Equatable{
  final List<Location>? locationsList;
  final Location? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;
  final List<Character>? residents;
  final bool? isRequeringData;
  final int? currentPage;
  

  const LocationsState({this.locationsList, this.searchResult, this.queryParameters, this.isActiveSearch, this.residents, this.isRequeringData = false, this.currentPage = 1});

  

  LocationsState copywith({
    List<Location>? locationsList,
    Location? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
    List<Character>? residents,
    bool? isRequeringData,
    int? currentPage
  }) => LocationsState(
    locationsList: locationsList ?? this.locationsList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch,
    residents: residents ?? this.residents,
    isRequeringData: isRequeringData ?? this.isRequeringData,
    currentPage: currentPage ?? this.currentPage
    );
    
      @override
      List<Object?> get props => [locationsList, searchResult, queryParameters, isActiveSearch, residents,isRequeringData, currentPage];  
  
}

