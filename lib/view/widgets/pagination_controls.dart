import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/utils.dart';


class PaginatonControls extends StatelessWidget {
  final void Function()? onPressed;
  const PaginatonControls({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    return  Positioned(
          bottom: width * 0.05,
          right:  width * 0.05,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Text("Next Page", 
                  style: TextStyle(color:  Color.fromARGB(191, 12, 255, 49), 
                    backgroundColor: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w600
                    ),)),
              FloatingActionButton(onPressed: onPressed, child: Icon(Icons.next_plan_sharp)),
            ],
          )) ;
  }
}