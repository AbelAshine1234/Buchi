import 'package:buchi/components/pets/pet_image.dart';
import 'package:buchi/pets/model/pet_model.dart';
import 'package:flutter/material.dart';

class ShowPetSearched extends StatelessWidget {
  final Iterable<Pet> pets;

  ShowPetSearched({required this.pets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets.elementAt(index);
                final hasPhotos = pet.photoUrls[0] != null;

                if (hasPhotos) {
                  return PetImage(pet: pet, url: pet.photoUrls[0]);
                } else {
                  return PetImage(pet: pet, url: "");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
