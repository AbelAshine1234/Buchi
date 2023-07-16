import 'package:buchi/components/different/custom_loadin_widget.dart';
import 'package:buchi/components/different/show_pet_loaded.dart';
import 'package:buchi/components/different/show_pet_searched.dart';
import 'package:buchi/components/header/header.dart';
import 'package:buchi/pets/bloc/pets_bloc%20state.dart';
import 'package:buchi/pets/bloc/pets_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowPets extends StatefulWidget {
  const ShowPets({super.key});

  @override
  State<ShowPets> createState() => _ShowPets();
}

class _ShowPets extends State<ShowPets> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetBloc, PetState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state is PetLoading ? null : MyHeader(),
          body: BlocBuilder<PetBloc, PetState>(
            builder: (context, state) {
              if (state is PetEmpty) {
                return const Center(
                  child: Text("no class"),
                );
              }
              if (state is PetLoading) {
                return CustomLoadingWidget();
              }
              if (state is PetLoaded) {
                final pets = state.pets;

                return ShowPetLoaded(pets: pets);
              }
              if (state is PetError) {
                return Text(state.message);
              }
              if (state is PetSearchedSuccessState) {
                if (state.pets.isEmpty) {
                  return Text("No values found");
                }
                return ShowPetSearched(
                  pets: state.pets,
                );
              }
              if (state is PetMultipleSearchState) {
                return FutureBuilder(
                  future: Future.delayed(Duration(seconds: 3)),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CustomLoadingWidget();
                    } else {
                      return ShowPetSearched(
                        pets: state.pets,
                      );
                    }
                  },
                );
              }

              return const Center(
                child: Text("class"),
              );
            },
          ),
        );
      },
    );
  }
}
