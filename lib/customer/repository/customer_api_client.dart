import 'dart:convert';

import 'package:buchi/pets/model/adoption_status.dart';
import 'package:buchi/customer/model/customer.dart';
import 'package:buchi/customer/model/customer_status.dart';
import 'package:http/http.dart' as http;

class CustomerApiClient {
  static const String createCustomerUrl =
      'http://64.226.105.205:9000/buchi/customer';
  static const String createAdoptionUrl =
      "http://64.226.105.205:9000/buchi/adoption";
  final http.Client client;

  CustomerApiClient({required this.client});

  Future<CustomerStatus> createCustomer(Customer customer) async {
    final msg = jsonEncode({"name": customer.name, "phone": customer.phone});
    try {
      final response = await client.post(Uri.parse(createCustomerUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: msg);
      if (response.statusCode == 200) {
        final dynamic json = jsonDecode(response.body);
        final customerStatus = CustomerStatus.fromJson(json);
        return customerStatus;
      } else {
        throw Exception('Failed to create customer');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future adoptPet(String customerId, String petId) async {
    final msg = jsonEncode({
      "customer_id": customerId,
      "pet_id": petId
    });
    try {
      final response = await client.post(Uri.parse(createAdoptionUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: msg);
      if (response.statusCode == 200) {
        final dynamic json = jsonDecode(response.body);
        final adoptionStatus = AdoptionStatus.fromJson(json);
        return adoptionStatus;
      } else {
        throw Exception('Failed to create customer');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
