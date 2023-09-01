import 'package:flutter/material.dart';
import 'package:rick_and_morty/domine/entities/location.dart';
import 'package:rick_and_morty/utils/utils.dart';
import 'package:rick_and_morty/view/widgets/location_info.dart';

class DetailLocation extends StatelessWidget {
  final Location location;
  DetailLocation({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"title": "Official Name", "data": "${location.name}"},
      {"title": "Type", "data": "${location.type}"},
      {"title": "Dimension", "data": "${location.dimension}"},
    ];
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          location.name,
           style:
              textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
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
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 2,
                  crossAxisCount: 3,
                  mainAxisExtent: width * 0.35),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    
                    Text(
                      "nameCharacter",
                      style: textTheme.bodySmall,
                    ),
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}