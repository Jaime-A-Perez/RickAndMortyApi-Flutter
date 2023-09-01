import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(BottomBarState()) {
    on<ChangeIndex>((event, emit) {
      emit(state.copywith(pageIndex: event.pageIndex));
    });
  }
}
