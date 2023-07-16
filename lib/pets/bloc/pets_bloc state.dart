import 'package:buchi/pets/model/adoption_status.dart';
import 'package:equatable/equatable.dart';
import 'package:buchi/pets/model/pet_model.dart';

abstract class PetState extends Equatable {}

class PetEmpty extends PetState {
  @override
  List<Object?> get props => [];
}

class PetLoading extends PetState {
  @override
  List<Object?> get props => [];
}

class PetLoaded extends PetState {
  final Iterable<Pet> pets;

  PetLoaded({required this.pets});

  @override
  List<Object?> get props => [pets];
}

class PetError extends PetState {
  final String message;
  PetError({required this.message});

  @override
  List<Object?> get props => [message];
}

class PetSearchedSuccessState extends PetState {
  final Iterable<Pet> pets;

  PetSearchedSuccessState({required this.pets});

  @override
  List<Object?> get props => [pets];
}

class PetMultipleSearchState extends PetState {
  final List<Pet> pets;

  PetMultipleSearchState({required this.pets});

  @override
  List<Object?> get props => [pets];
}
