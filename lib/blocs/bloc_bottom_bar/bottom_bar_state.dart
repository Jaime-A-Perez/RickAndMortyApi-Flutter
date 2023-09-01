part of 'bottom_bar_bloc.dart';

class BottomBarState extends Equatable {
  final int pageIndex;

  const BottomBarState({this.pageIndex = 0});
  
  BottomBarState copywith({    
   final int? pageIndex
  }) => BottomBarState(
    pageIndex: pageIndex ?? this.pageIndex 
  );

  @override
  List<Object> get props => [pageIndex];
}
