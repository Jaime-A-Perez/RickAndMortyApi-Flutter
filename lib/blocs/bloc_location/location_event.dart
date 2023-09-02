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

class AddResidents extends LocationEvent {
  final List<String> listResidents;

  AddResidents(this.listResidents);
}

class AddNextPageOfLocationBloc extends LocationEvent {
 final int currentPage;

  AddNextPageOfLocationBloc(this.currentPage);
}

class IsRequeringData extends LocationEvent {
  final bool isRequeringData;

  IsRequeringData(this.isRequeringData);
}