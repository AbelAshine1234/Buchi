import 'package:buchi/components/different/custom_bottom_adopt.dart';
import 'package:buchi/components/header/header.dart';
import 'package:buchi/pets/model/pet_model.dart';
import 'package:buchi/routes.dart';
import 'package:flutter/material.dart';

class AdoptPet extends StatelessWidget {
  final Pet pet;

  const AdoptPet({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = pet.photoUrls[0] ?? '';

    final sharedTextStyle = TextStyle(
      fontSize: 20,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyHeader(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Container(
                  color: Colors.grey,
                  child: const Center(
                    child: Text('Failed to load image'),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3, // Increase the flex value to make the bottom screen bigger
            child: Container(
              color: Color.fromARGB(232, 231, 214, 214),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(pet.type,
                      style: TextStyle(
                        color: Color.fromARGB(232, 70, 66, 66),
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      )),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Text(
                    pet.good_with_children.toString(),
                    style: sharedTextStyle,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Text(
                    pet.age,
                    style: sharedTextStyle,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Text(
                    pet.gender,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Text(
                    pet.size,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 177, 162, 162),
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: CustomButtonAdopt(
                        onPressed: () => {
                          Navigator.pushNamed(
                              context, RouteGenerator.createCustomer,
                              arguments: pet)
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
