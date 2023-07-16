import 'package:http/http.dart' as http;
import 'pets_api_client.dart';
void main() async {
  final client = http.Client();
  final apiClient = PetApiClient(client: client);

  try {
    final pet = await apiClient.getAllPets();
    print(pet);
  } catch (e) {
    print(e);
  } finally {
    client.close();
  }
}