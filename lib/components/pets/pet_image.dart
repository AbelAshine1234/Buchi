import 'package:buchi/pets/model/pet_model.dart';
import 'package:flutter/material.dart';

class PetImage extends StatelessWidget {
  final Pet pet;
  final String url;

  const PetImage({Key? key, required this.pet, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        url != "" ? Padding(
          padding: EdgeInsets.all(10.0),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 400,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Container(
                color: Colors.grey,
                // width: MediaQuery.of(context).size.width,
                height: 400,
                child: const Center(
                  child: Text('Failed to load image'),
                ),
              );
            },
          ),
        ) : Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.grey,
            height: 400,
            child: const Center(
              child: Text('Failed to load image'),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              pet.type,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right, // Align text to the right
            ),
          ),
        ),
      ],
    );
  }
}