import 'package:buchi/customer/model/customer.dart';
import 'package:buchi/customer/model/customer_status.dart';
import 'package:buchi/customer/repository/customer_api_client.dart';

class CustomerRepository {
  final CustomerApiClient customerApiClient;
  CustomerRepository({required this.customerApiClient});
  Future<CustomerStatus> createCustomer(Customer customer) async {
    return await customerApiClient.createCustomer(customer);
  }

  Future adoptPet(String customerId, String petId) async {
    return await customerApiClient.adoptPet(customerId, petId);
  }
}
