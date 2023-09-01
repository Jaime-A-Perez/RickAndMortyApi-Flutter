import 'package:flutter/material.dart';
import 'package:rick_and_morty/domine/entities/character.dart';
import 'package:rick_and_morty/utils/utils.dart';

class CardCharacter extends StatelessWidget {
  final String name;
  final String image;
  final Status status;
  final void Function()? onTap;

  const CardCharacter(
      {Key? key,
      required this.name,
      required this.image,
      required this.status,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: Image.network(
                image,
                width: width * 0.477,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  name,
                  style: textTheme.titleMedium,
                  textAlign: TextAlign.center,
                      maxLines: 1,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    statusLive(status),
                    Text(
                      status.name.toUpperCase(),
                      style: textTheme.bodyMedium,                      
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Icon statusLive(Status status) {
  switch (status) {
    case Status.alive:
      return Icon(Icons.sentiment_very_satisfied_outlined, color: Colors.green,);
    case Status.dead:
      return Icon(Icons.sentiment_very_dissatisfied_rounded, color: Colors.red,);
    default:
      return Icon(Icons.question_mark_rounded);
  }
}