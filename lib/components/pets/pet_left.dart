import 'package:buchi/pets/model/pet_model.dart';
import 'package:buchi/pets/model/photos.dart';
import 'package:buchi/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PetLeft extends StatelessWidget {
  final String type;
  final String gender;
  final String size;
  final String age;
  final bool goodWithChidern;
  final String url;
  final String id;
  final List<dynamic> photoUrls;

  const PetLeft({
    super.key,
    required this.id,
    required this.type,
    required this.gender,
    required this.size,
    required this.age,
    required this.goodWithChidern,
    required this.url,
    required this.photoUrls
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteGenerator.adoptPage,arguments:Pet(type: type, gender: gender, size: size, age: age, good_with_children: goodWithChidern, id: id, photoUrls: photoUrls));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: double.infinity,
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: double.infinity,
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
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 16, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                type,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                gender,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                age,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                size,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
