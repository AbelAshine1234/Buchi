import 'package:buchi/pets/model/pet_model.dart';
import 'package:buchi/pets/repository/pets_api_client.dart';

class PetRepository {
  final PetApiClient petApiClient;
  PetRepository({required this.petApiClient});

  Future<List<Pet>> tryPetsClient() async {
    return await petApiClient.getAllPets();
  }

  Future<List<Pet>> searchPets({
    required int limit,
    required String type,
    required String gender,
    required String size,
    required String age,
    required String goodWithChildren,
  }) async {
    return await petApiClient.searchPets(
      limit: limit,
      type: type,
      gender: gender,
      size: size,
      age: age,
      goodWithChildren: goodWithChildren,
    );
  }
}
