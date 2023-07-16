import 'package:buchi/components/pets/pet_left.dart';
import 'package:buchi/components/pets/pet_right.dart';
import 'package:buchi/pets/model/pet_model.dart';
import 'package:flutter/material.dart';

class ShowPetLoaded extends StatelessWidget {
  final Iterable<Pet> pets;

  ShowPetLoaded({required this.pets});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 231, 214, 214),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets.elementAt(index);
                if (index % 2 == 0) {
                  if (pet.photoUrls[0] == null) {
                    return PetRight(
                        type: pet.type,
                        gender: pet.gender,
                        size: pet.size,
                        photoUrls: pet.photoUrls,
                        age: pet.age,
                        id: pet.id,
                        goodWithChidern: pet.good_with_children,
                        url: "");
                  }
                  return PetRight(
                      id: pet.id,
                      type: pet.type,
                      gender: pet.gender,
                      size: pet.size,
                      photoUrls: pet.photoUrls,
                      age: pet.age,
                      goodWithChidern: pet.good_with_children,
                      url: pet.photoUrls[0]);
                } else {
                  if (pet.photoUrls[0] == null) {
                    return PetLeft(
                        id: pet.id,
                        photoUrls: pet.photoUrls,
                        type: pet.type,
                        gender: pet.gender,
                        size: pet.size,
                        age: pet.age,
                        goodWithChidern: pet.good_with_children,
                        url: "");
                  }
                  return PetLeft(
                      id: pet.id,
                      type: pet.type,
                      gender: pet.gender,
                      size: pet.size,
                      age: pet.age,
                      goodWithChidern: pet.good_with_children,
                      url: pet.photoUrls[0],
                      photoUrls: pet.photoUrls);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
