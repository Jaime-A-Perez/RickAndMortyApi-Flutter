import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network( 
                      "urlImage",
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){
                        return Image.asset("assets/images/notLoad.jpeg",
                        fit: BoxFit.cover,
                        );
                      }           
                  );
  }
}