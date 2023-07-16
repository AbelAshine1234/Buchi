import 'package:buchi/components/header/header.dart';
import 'package:buchi/components/pets/pet_left.dart';
import 'package:buchi/components/pets/pet_right.dart';
import 'package:buchi/pets/bloc/pets_bloc%20state.dart';
import 'package:buchi/pets/bloc/pets_bloc.dart';
import 'package:buchi/presentation/pets/pet_search_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPets extends StatelessWidget {
  const SearchPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(),
      body: BlocBuilder<PetBloc, PetState>(
        builder: (context, state) {
          if (state is PetLoaded) {
            return PetSearchForm(
              petTypes: state.pets.map((pet) => pet.type).toSet().toList(),
              genders: state.pets.map((pet) => pet.gender).toSet().toList(),
              sizes: state.pets.map((pet) => pet.size).toSet().toList(),
              ages: state.pets.map((pet) => pet.age).toSet().toList(),
              goodWithChildren: state.pets
                  .map((pet) => pet.good_with_children.toString())
                  .toSet()
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
