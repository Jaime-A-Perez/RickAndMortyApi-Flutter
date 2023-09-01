part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}
class InitCharacterBloc extends LocationEvent {
  InitCharacterBloc();
}

class AddNewItems extends LocationEvent {
  AddNewItems();
}

class SearchEvent extends LocationEvent {
  
}