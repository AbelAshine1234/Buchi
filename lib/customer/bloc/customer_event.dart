import 'package:buchi/customer/model/customer.dart';
import 'package:buchi/pets/model/pet_model.dart';
import 'package:equatable/equatable.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
}

class CustomerEmptyEvent extends CustomerEvent {
  @override
  List<Object?> get props => [];
}

class CreateCustomerEvent extends CustomerEvent {
  final Customer customer;

  const CreateCustomerEvent({required this.customer});

  @override
  List<Object?> get props => [customer];
}

class AdoptPetEvent extends CustomerEvent {
  final String petId;
  final String customerId;
  const AdoptPetEvent({required this.petId, required this.customerId});

  @override
  List<Object?> get props => [petId, customerId];
}
