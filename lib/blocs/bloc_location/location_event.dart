part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}
class InitLocationBloc extends LocationEvent {
  InitLocationBloc();
}

class AddNewItems extends LocationEvent {
  AddNewItems();
}

class SearchEvent extends LocationEvent {
  
}