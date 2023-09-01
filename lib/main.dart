import 'package:flutter/material.dart';
import 'package:rick_and_morty/blocs/bloc_bottom_bar/bottom_bar_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_characters/characters_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_episodes/episodes_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_location/location_bloc.dart';
import 'package:rick_and_morty/config/theme/app_theme.dart';
import 'package:rick_and_morty/view/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
        BlocProvider(create: (BuildContext context) => CharactersBloc()..add(InitCharacterBloc()),
        lazy: false,
        ),
        BlocProvider(create: (BuildContext context) => LocationBloc()..add(InitLocationBloc()),
        lazy: false,
        ),
        BlocProvider(create: (BuildContext context) => EpisodesBloc()..add(InitEpisodesBloc()),
        lazy: false),
        BlocProvider(create: (BuildContext context) => BottomBarBloc()),        
      ],
      child: MaterialApp(
          theme: AppTheme().getTheme(),
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: Home()),
    );
  }
}
