part of 'characters_bloc.dart';

class CharactersState {
  final List<Character>? characterList;
  final Character? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;

  CharactersState({this.characterList, this.searchResult, this.queryParameters, this.isActiveSearch});

  CharactersState copywith({
    List<Character>? characterList,
    Character? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
  }) => CharactersState(
    characterList: characterList ?? this.characterList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch:  isActiveSearch ?? this.isActiveSearch) ;
  
}

