part of 'bottom_bar_bloc.dart';

@immutable
abstract class BottomBarEvent{}

class ChangeIndex extends BottomBarEvent {
  final int pageIndex;
  ChangeIndex(this.pageIndex);
}