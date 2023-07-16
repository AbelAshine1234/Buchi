import 'package:bloc/bloc.dart';
import 'package:buchi/pets/bloc/pets_bloc%20event.dart';
import 'package:buchi/pets/bloc/pets_bloc%20state.dart';
import 'package:buchi/pets/model/pet_model.dart';
import 'package:buchi/pets/repository/pets_repository.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  final PetRepository petsRepository;

  PetBloc({required this.petsRepository}) : super(PetEmpty());

  @override
  Stream<PetState> mapEventToState(PetEvent event) async* {
    if (event is GetAllPetsEvent) {
      yield PetLoading();
      try {
        final data = await petsRepository.tryPetsClient();
        yield PetLoaded(pets: data);
      } catch (e) {
        yield PetError(message: e.toString());
      }
    }
    if (event is SearchPetEvent) {
      yield PetLoading();
      try {
        final data = await petsRepository.searchPets(
            limit: event.limit,
            type: event.type,
            gender: event.gender,
            size: event.size,
            age: event.age,
            goodWithChildren: event.goodWithChildren);
        yield PetSearchedSuccessState(pets: data);
      } catch (e) {
        yield PetError(message: e.toString());
      }
    }
    if (event is MultipSearchPetEvent) {
      try {
        final List<Pet> newPets = await petsRepository.searchPets(
          limit: event.limit,
          type: event.type,
          gender: event.gender,
          size: event.size,
          age: event.age,
          goodWithChildren: event.goodWithChildren,
        );
        if (state is PetMultipleSearchState) {
          final List<Pet> currentPets = (state as PetMultipleSearchState).pets;
          final List<Pet> allPets = currentPets.toList()..addAll(newPets);
          yield PetMultipleSearchState(pets: allPets);
        } else {
          yield PetMultipleSearchState(pets: newPets);
        }
      } catch (e) {
        yield PetError(message: e.toString());
      }
    }
  }
}
