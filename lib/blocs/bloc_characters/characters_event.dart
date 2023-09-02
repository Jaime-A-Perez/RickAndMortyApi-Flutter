part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent {}

class InitCharacterBloc extends CharactersEvent {
  InitCharacterBloc();
}

class AddNewItems extends CharactersEvent {
  AddNewItems();
}

class SearchEvent extends CharactersEvent {
  
}

class IsRequeringData extends CharactersEvent {
  final bool isRequeringData;

  IsRequeringData(this.isRequeringData);
}