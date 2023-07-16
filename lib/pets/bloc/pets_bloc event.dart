import 'package:equatable/equatable.dart';

abstract class PetEvent extends Equatable {
  const PetEvent();
}

class GetAllPetsEvent extends PetEvent {
  @override
  List<Object?> get props => [];
}

class SearchPetEvent extends PetEvent {
  final int limit;
  final String type;
  final String gender;
  final String size;
  final String age;
  final String goodWithChildren;

  SearchPetEvent({
    required this.limit,
    required this.type,
    required this.gender,
    required this.size,
    required this.age,
    required this.goodWithChildren,
  });

  @override
  List<Object?> get props => [limit, type, gender, size, age, goodWithChildren];
}


class MultipSearchPetEvent extends PetEvent {
  final int limit;
  final String type;
  final String gender;
  final String size;
  final String age;
  final String goodWithChildren;

  MultipSearchPetEvent({
    required this.limit,
    required this.type,
    required this.gender,
    required this.size,
    required this.age,
    required this.goodWithChildren,
  });

  @override
  List<Object?> get props => [limit, type, gender, size, age, goodWithChildren];
}