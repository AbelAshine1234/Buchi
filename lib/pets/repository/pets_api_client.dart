import 'dart:convert';
import 'package:buchi/pets/model/adoption_status.dart';
import 'package:http/http.dart' as http;
import 'package:buchi/pets/model/pet_model.dart';

class PetApiClient {
  static const String baseUrl =
      'http://64.226.105.205:9000/buchi/pet?limit=25512467';

  final searchUrl = 'http://64.226.105.205:9000/buchi/pet';

  final http.Client client;

  PetApiClient({required this.client});

  Future<List<Pet>> getAllPets() async {
    try {
      final uri = Uri.parse(baseUrl);
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final dynamic json = jsonDecode(response.body);
        if (json is List<dynamic>) {
          final List<Pet> pets =
              json.map((petJson) => Pet.fromJson(petJson)).toList();
          return pets;
        } else if (json is Map<String, dynamic> && json.containsKey('pets')) {
          final List<dynamic> jsonList = json['pets'];
          final List<Pet> pets =
              jsonList.map((petJson) => Pet.fromJson(petJson)).toList();
          return pets;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Image unavaliable');
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Pet>> searchPets({
    required int limit,
    required String type,
    required String gender,
    required String size,
    required String age,
    required String goodWithChildren,
  }) async {
    try {
      // Remove empty string values from query parameters

      // Remove empty string values from query parameters
      
      final queryParams = <String, String>{};
      if (limit != null) queryParams['limit'] = limit.toString();
      if (type.isNotEmpty) queryParams['type'] = type;
      if (gender.isNotEmpty) queryParams['gender'] = gender;
      if (size.isNotEmpty) queryParams['size'] = size;
      if (age.isNotEmpty) {
        final words = age.split(" ");
        final word1 = words.isNotEmpty ? words[0] : "";
        final word2 = words.length > 1 ? words[1] : "";
        final appendedage = word1 + word2;
        queryParams['age'] = appendedage;
      }

      if (goodWithChildren != null && goodWithChildren.toString().isNotEmpty) {
        queryParams['good_with_children'] = goodWithChildren.toString();
      }

      final query = Uri(queryParameters: queryParams).query;
      final uri = Uri.parse('$searchUrl?$query');
      final response = await client.get(uri);

      print(uri);
      if (response.statusCode == 200) {
        final dynamic json = jsonDecode(response.body);
        if (json is List<dynamic>) {
          final List<Pet> pets =
              json.map((petJson) => Pet.fromJson(petJson)).toList();
          return pets;
        } else if (json is Map<String, dynamic> && json.containsKey('pets')) {
          final List<dynamic> jsonList = json['pets'];
          final List<Pet> pets =
              jsonList.map((petJson) => Pet.fromJson(petJson)).toList();
          return pets;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Image unavailable');
      }
    } catch (e) {
      return [];
    }
  }

    Future<List<Pet>> searchMultipleValuePets({
    required int limit,
    required String type,
    required String gender,
    required String size,
    required String age,
    required String goodWithChildren,
  }) async {
    try {
      // Remove empty string values from query parameters

      // Remove empty string values from query parameters
      final queryParams = <String, String>{};
      if (limit != null) queryParams['limit'] = limit.toString();
      if (type.isNotEmpty) queryParams['type'] = type;
      if (gender.isNotEmpty) queryParams['gender'] = gender;
      if (size.isNotEmpty) queryParams['size'] = size;
      if (age.isNotEmpty) {
        final words = age.split(" ");
        final word1 = words.isNotEmpty ? words[0] : "";
        final word2 = words.length > 1 ? words[1] : "";
        final appendedage = word1 + word2;
        queryParams['age'] = appendedage;
      }

      if (goodWithChildren != null && goodWithChildren.toString().isNotEmpty) {
        queryParams['good_with_children'] = goodWithChildren.toString();
      }

      final query = Uri(queryParameters: queryParams).query;
      final uri = Uri.parse('$searchUrl?$query');
      final response = await client.get(uri);
      print(uri);

      if (response.statusCode == 200) {
        final dynamic json = jsonDecode(response.body);
        if (json is List<dynamic>) {
          final List<Pet> pets =
              json.map((petJson) => Pet.fromJson(petJson)).toList();
          return pets;
        } else if (json is Map<String, dynamic> && json.containsKey('pets')) {
          final List<dynamic> jsonList = json['pets'];
          final List<Pet> pets =
              jsonList.map((petJson) => Pet.fromJson(petJson)).toList();
          return pets;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Image unavailable');
      }
    } catch (e) {
      return [];
    }
  }
}
