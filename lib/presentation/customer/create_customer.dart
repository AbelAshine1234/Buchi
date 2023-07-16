import 'package:buchi/components/header/header.dart';
import 'package:buchi/customer/bloc/customer_bloc.dart';
import 'package:buchi/customer/bloc/customer_event.dart';
import 'package:buchi/customer/bloc/customer_state.dart';
import 'package:buchi/customer/model/customer.dart';
import 'package:buchi/pets/bloc/pets_bloc.dart';
import 'package:buchi/pets/model/pet_model.dart';
import 'package:buchi/presentation/customer/create_customer_form.dart';
import 'package:buchi/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/different/custom_loadin_widget.dart';
import '../../pets/bloc/pets_bloc event.dart';

class CreateCustomer extends StatefulWidget {
  final Pet pet;

  const CreateCustomer({super.key, required this.pet});
  @override
  State<CreateCustomer> createState() => _CreateCustomerState(pet);
}

class _CreateCustomerState extends State<CreateCustomer> {
  final Pet pet;

  _CreateCustomerState(this.pet);
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomerBloc>(context).add(CustomerEmptyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(),
      body: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state is CustomerCreatedState) {
            BlocProvider.of<CustomerBloc>(context).add(
                AdoptPetEvent(petId: pet.id, customerId: state.customer.id));
          }
          if (state is PetAdoptedByCustomerState) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.popAndPushNamed(context, RouteGenerator.congratulation);
            });
          }

          if (state is CustomerLoadingState) {
            return CustomLoadingWidget();
          }
          if (state is CustomerErrorState) {
            return Text(state.message);
          }
          if (state is CustomerEmptyState) {
            return CreateCustomerForm();
          }
          return CustomLoadingWidget();
        },
      ),
    );
  }
}
