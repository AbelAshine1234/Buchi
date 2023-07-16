import 'package:bloc/bloc.dart';
import 'package:buchi/customer/bloc/customer_event.dart';
import 'package:buchi/customer/bloc/customer_state.dart';
import 'package:buchi/customer/repository/customer_api_repository.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;

  CustomerBloc({required this.customerRepository})
      : super(CustomerEmptyState());

  @override
  Stream<CustomerState> mapEventToState(CustomerEvent event) async* {
    if (event is CustomerEmptyEvent) {
      yield CustomerEmptyState();
    }
    if (event is CreateCustomerEvent) {
      yield CustomerLoadingState();
      try {
        final data = await customerRepository.createCustomer(event.customer);
        yield CustomerCreatedState(customer: data);
      } catch (e) {
        yield CustomerErrorState(message: e.toString());
      }
    }
    if (event is AdoptPetEvent) {
      yield CustomerLoadingState();
      try {
        final adoptionStatus =
            await customerRepository.adoptPet(event.customerId, event.petId);
        yield PetAdoptedByCustomerState(adoptionStatus: adoptionStatus);
      } catch (e) {
        yield CustomerErrorState(message: e.toString());
      }
    }
  }
}
