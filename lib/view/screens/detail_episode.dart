import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_episodes/episodes_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_location/location_bloc.dart';
import 'package:rick_and_morty/domine/entities/epidode.dart';
import 'package:rick_and_morty/domine/entities/location.dart';
import 'package:rick_and_morty/utils/utils.dart';
import 'package:rick_and_morty/view/widgets/location_info.dart';

class DetailEpisode extends StatelessWidget {
  final Episode episode;
  DetailEpisode({Key? key,  required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"title": "Official Name", "data": "${episode.name}"},
      {"title": "Launch Date", "data": "${episode.airDate}"},
      {"title": "${formatSingleEpisode('S01E04')}", "data": ""},
    ];
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          episode.name,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Text("Properties", style: textTheme.titleLarge),
            const SizedBox(height: 10),
            ...items
                .map((item) => LocationInfo(
                    title: item["title"]!, subtitle: item["data"]!))
                .toList(),
            const SizedBox(height: 10),
            Text("Residents:", style: textTheme.titleLarge),
            const SizedBox(height: 10),
            BlocBuilder<EpisodesBloc, EpisodesState>(
              builder: (context, state) {  
                return Expanded(
                    child: GridView.builder(
                  itemCount: state.characterInEpisode?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 2,
                      crossAxisCount: 3,
                      mainAxisExtent: width * 0.4),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      // borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30) ),
                      child: 
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(38),
                            child: Image.network(
                                state.characterInEpisode![index].image),
                          ),
                          Text(
                            state.characterInEpisode![index].name,
                            style: TextStyle(color:  Color.fromRGBO(254, 39, 204, 1),),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
