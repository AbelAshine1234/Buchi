import 'package:buchi/customer/model/customer.dart';
import 'package:buchi/customer/model/customer_status.dart';
import 'package:buchi/pets/model/adoption_status.dart';
import 'package:equatable/equatable.dart';

abstract class CustomerState extends Equatable {}

class CustomerEmptyState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerLoadingState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerCreatedState extends CustomerState {
  final CustomerStatus customer;

  CustomerCreatedState({required this.customer});

  @override
  List<Object?> get props => [customer];
}

class CustomerErrorState extends CustomerState {
  final String message;
  CustomerErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class PetAdoptedByCustomerState extends CustomerState{
  final AdoptionStatus adoptionStatus;

  PetAdoptedByCustomerState({required this.adoptionStatus});
  
  @override
  List<Object?> get props => [adoptionStatus];

}