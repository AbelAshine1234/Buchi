import 'package:buchi/customer/bloc/customer_event.dart';
import 'package:buchi/customer/model/customer.dart';
import 'package:buchi/pets/model/pet_model.dart';
import 'package:buchi/presentation/customer/create_customer.dart';
import 'package:buchi/presentation/customer/customer_congratulation.dart';
import 'package:buchi/presentation/home/delayed_page.dart';
import 'package:buchi/presentation/pets/ShowPets.dart';
import 'package:buchi/presentation/pets/adopt_pet.dart';
import 'package:buchi/presentation/pets/search_pets.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class RouteGenerator {
  static const home = "/";
  static const showPets = "/showpets";
  static const searchPets = "/searchpets";
  static const delayedPage = "/delayedpage";
  static const adoptPage = "/adoptpage";
  static const createCustomer = "/createcustomer";
  static const congratulation = "/congratulation";

  RouteGenerator._();
  static Route<dynamic> routegenerator(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => DelayedPage());
      case showPets:
        return MaterialPageRoute(builder: (context) => const ShowPets());
      case searchPets:
        return MaterialPageRoute(builder: (context) => const SearchPets());
      case delayedPage:
        return MaterialPageRoute(builder: (context) => DelayedPage());
      case adoptPage:
        final Pet pet = settings.arguments as Pet;
        return MaterialPageRoute(
            builder: (context) => AdoptPet(
                  pet: pet,
                ));
      case createCustomer:
        final Pet pet = settings.arguments as Pet;
        return MaterialPageRoute(
            builder: (context) => CreateCustomer(
                  pet: pet,
                ));
      case congratulation:
        return MaterialPageRoute(
            builder: (context) => CustomerCongratulation());

      default:
        throw const FormatException("Could not found route");
    }
  }
}
