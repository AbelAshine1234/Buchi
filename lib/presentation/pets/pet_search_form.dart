import 'package:buchi/pets/bloc/pets_bloc.dart';
import 'package:buchi/pets/model/pet_model.dart';
import 'package:buchi/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pets/bloc/pets_bloc event.dart';
import '../../pets/bloc/pets_bloc state.dart';

class PetSearchForm extends StatefulWidget {
  final List<String> petTypes;
  final List<String> genders;
  final List<String> sizes;
  final List<String> ages;
  final List<String> goodWithChildren;

  PetSearchForm({
    required this.petTypes,
    required this.genders,
    required this.sizes,
    required this.ages,
    required this.goodWithChildren,
  });

  @override
  _PetSearchFormState createState() => _PetSearchFormState();
}

class _PetSearchFormState extends State<PetSearchForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _queryController;
  List<String> _selectedPetTypes = [];
  List<String> _selectedGenders = [];
  List<String> _selectedSizes = [];
  List<String> _selectedAges = [];
  List<String> _selectedGoodWithChildren = [];

  @override
  void initState() {
    super.initState();
    _queryController = TextEditingController();
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetBloc, PetState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 50, right: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Type',
                      contentPadding: EdgeInsets.zero,
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      children: widget.petTypes.map((String type) {
                        return FilterChip(
                          label: Text(type),
                          selected: _selectedPetTypes.contains(type),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedPetTypes.add(type);
                              } else {
                                _selectedPetTypes.remove(type);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      contentPadding: EdgeInsets.zero,
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      children: widget.genders.map((String gender) {
                        return FilterChip(
                          label: Text(gender),
                          selected: _selectedGenders.contains(gender),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedGenders.add(gender);
                              } else {
                                _selectedGenders.remove(gender);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Size',
                      contentPadding: EdgeInsets.zero,
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      children: widget.sizes.map((String size) {
                        return FilterChip(
                          label: Text(size),
                          selected: _selectedSizes.contains(size),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedSizes.add(size);
                              } else {
                                _selectedSizes.remove(size);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      contentPadding: EdgeInsets.zero,
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      children: widget.ages.map((String age) {
                        return FilterChip(
                          label: Text(age),
                          selected: _selectedAges.contains(age),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedAges.add(age);
                              } else {
                                _selectedAges.remove(age);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Good with Children',
                      contentPadding: EdgeInsets.zero,
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      children: widget.goodWithChildren
                          .map((String goodWithChildren) {
                        return FilterChip(
                          label: Text(goodWithChildren),
                          selected: _selectedGoodWithChildren
                              .contains(goodWithChildren),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedGoodWithChildren.add(goodWithChildren);
                              } else {
                                _selectedGoodWithChildren
                                    .remove(goodWithChildren);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      List<String> selectedPetTypes =
                          _selectedPetTypes.toList();
                      List<String> selectedGenders = _selectedGenders.toList();
                      List<String> selectedSizes = _selectedSizes.toList();
                      List<String> selectedAges = _selectedAges.toList();
                      List<String> selectedGoodWithChilder =
                          _selectedGoodWithChildren.toList();
                      int maxIndex = -1;
                      if (_selectedPetTypes.length > maxIndex) {
                        maxIndex = _selectedPetTypes.length;
                      }
                      if (_selectedGenders.length > maxIndex) {
                        maxIndex = _selectedGenders.length;
                      }
                      if (_selectedSizes.length > maxIndex) {
                        maxIndex = _selectedSizes.length;
                      }
                      if (_selectedAges.length > maxIndex) {
                        maxIndex = _selectedAges.length;
                      }
                      if (_selectedGoodWithChildren.length > maxIndex) {
                        maxIndex = _selectedGoodWithChildren.length;
                      }

                      for (var i = 0; i < selectedPetTypes.length; i++) {
                        BlocProvider.of<PetBloc>(context)
                            .add(MultipSearchPetEvent(
                          limit: 25512467,
                          type: selectedPetTypes[i],
                          gender: "",
                          size: "",
                          age: "",
                          goodWithChildren: "",
                        ));
                      }

                      for (var i = 0; i < selectedGenders.length; i++) {
                        BlocProvider.of<PetBloc>(context)
                            .add(MultipSearchPetEvent(
                          limit: 25512467,
                          type: "",
                          gender: selectedGenders[i],
                          size: "",
                          age: "",
                          goodWithChildren: "",
                        ));
                      }

                      for (var i = 0; i < selectedSizes.length; i++) {
                        BlocProvider.of<PetBloc>(context)
                            .add(MultipSearchPetEvent(
                          limit: 25512467,
                          type: "",
                          gender: "",
                          size: selectedSizes[i],
                          age: "",
                          goodWithChildren: "",
                        ));
                      }

                      for (var i = 0; i < selectedAges.length; i++) {
                        BlocProvider.of<PetBloc>(context)
                            .add(MultipSearchPetEvent(
                          limit: 25512467,
                          type: "",
                          gender: "",
                          size: "",
                          age: selectedAges[i],
                          goodWithChildren: "",
                        ));
                      }
                      for (var i = 0; i < selectedGoodWithChilder.length; i++) {
                        BlocProvider.of<PetBloc>(context)
                            .add(MultipSearchPetEvent(
                          limit: 25512467,
                          type: "",
                          gender: "",
                          size: "",
                          age: "",
                          goodWithChildren: selectedGoodWithChilder[i],
                        ));
                      }

                      Navigator.popAndPushNamed(
                          context, RouteGenerator.showPets);
                    }
                  },
                  child: const Expanded(
                    flex: 1,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 87, 69, 69),
                        radius: 20,
                        child: Icon(
                          Icons.search,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
