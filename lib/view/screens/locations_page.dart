import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_location/location_bloc.dart';
import 'package:rick_and_morty/view/screens/detail_location.dart';
import 'package:rick_and_morty/view/widgets/card_location.dart';
import 'package:rick_and_morty/view/widgets/pagination_controls.dart';

class LocationsPage extends StatefulWidget {
   LocationsPage({Key? key});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    loadNewData();
    super.initState();
  }

  void loadNewData(){
    scrollController.addListener(() {
        if (scrollController.position.pixels + 300 >= 
        scrollController.position.maxScrollExtent &&
        scrollController.position.pixels  <= 
        scrollController.position.maxScrollExtent
        ){
         final bloc = context.read<LocationBloc>();
         bloc.add(IsRequeringData(true));
        }
       });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final blocLocation = context.watch<LocationBloc>(); 

    return Scaffold(
      appBar: AppBar(
    centerTitle: true,
    title: Text(
      "Location",
      style: textTheme.displaySmall,
    ),
      ),
      body: Stack(
    children: [
      Column(
        children: [
          Expanded(
            child: ListView.builder(
               controller: scrollController,
                itemCount: blocLocation.state.locationsList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardLocation(
                    location: blocLocation.state.locationsList![index],
                    onTap: () {
                      final blocResidents = context.read<LocationBloc>();
                      blocResidents.add(AddResidents( blocLocation.state.locationsList![index].residents));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DetailLocation(location: blocLocation.state.locationsList![index],)));
                    },
                  );
                }),
          ),   
        ],
      ),  
      blocLocation.state.isRequeringData! ?          
      PaginatonControls(onPressed:  ()async{
            final blocLocationrRead = context.read<LocationBloc>();
            blocLocationrRead.add(AddNextPageOfLocationBloc(blocLocationrRead.state.currentPage! + 1));
            await Future.delayed(const Duration(milliseconds: 600),(){
              scrollController.jumpTo(scrollController.position.pixels + 80);
            blocLocationrRead.add(IsRequeringData(false));
            });
          }):
       Center(),
    ],
      ),
    );
  }
}