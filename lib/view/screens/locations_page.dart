import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_location/location_bloc.dart';
import 'package:rick_and_morty/view/screens/detail_location.dart';
import 'package:rick_and_morty/view/widgets/card_location.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final blocLocation = context.watch<LocationBloc>(); 

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Location",
          style: textTheme.displaySmall,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: blocLocation.state.locationsList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardLocation(
                    location: blocLocation.state.locationsList![index],
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DetailLocation(location: blocLocation.state.locationsList![index],)));
                    },
                  );
                }),
          )
        ],
      ),
    ));
  }
}