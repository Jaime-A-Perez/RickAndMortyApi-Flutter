import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/blocs/bloc_episodes/episodes_bloc.dart';
import 'package:rick_and_morty/view/screens/detail_episode.dart';
import 'package:rick_and_morty/view/widgets/card_episodes.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final blocEpisodes = context.watch<EpisodesBloc>();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Episodes",
          style: textTheme.displaySmall,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: blocEpisodes.state.episodesList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardEpisode(
                    episode: blocEpisodes.state.episodesList![index],
                    onTap: () {
                      final blocEpisodes = context.read<EpisodesBloc>();
                      blocEpisodes.add(AddCharacterOfEpisodeEvent( blocEpisodes.state.episodesList![index].characters));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>DetailEpisode(episode: blocEpisodes.state.episodesList![index],),
                          ));
                    },
                  );
                }),
          )
        ],
      ),
    ));
  }
}