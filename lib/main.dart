import 'package:buchi/customer/bloc/customer_bloc.dart';
import 'package:buchi/customer/repository/customer_api_client.dart';
import 'package:buchi/customer/repository/customer_api_repository.dart';
import 'package:buchi/presentation/home/delayed_page.dart';
import 'package:buchi/pets/bloc/pets_bloc.dart';
import 'package:buchi/pets/repository/pets_api_client.dart';
import 'package:buchi/pets/repository/pets_repository.dart';
import 'package:buchi/presentation/pets/adopt_pet.dart';
import 'package:buchi/presentation/pets/ShowPets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'routes.dart';

void main() {
  final PetRepository petRepository =
      PetRepository(petApiClient: PetApiClient(client: http.Client()));
  final CustomerRepository customerRepository=CustomerRepository(customerApiClient: CustomerApiClient(client: http.Client()));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPet(petRepository: petRepository,customerRepository: customerRepository,),
  ));
}

class MyPet extends StatelessWidget {
  final PetRepository petRepository;
  final CustomerRepository customerRepository;

  const MyPet({super.key, required this.petRepository,required this.customerRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => PetBloc(petsRepository: petRepository)),
            BlocProvider(create: (context)=>CustomerBloc(customerRepository: customerRepository))
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteGenerator.home,
            onGenerateRoute: RouteGenerator.routegenerator,
            
          ),
        ),
      ),
    );
  }
}
