import 'package:buchi/presentation/initial/brand_page.dart';
import 'package:buchi/presentation/pets/adopt_pet.dart';
import 'package:buchi/presentation/pets/search_pets.dart';
import 'package:buchi/presentation/pets/ShowPets.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Visibility(
            visible: _selectedIndex == 0,
            child: const ShowPets(),
          ),
          Visibility(
            visible: _selectedIndex == 1,
            child: const SearchPets(),
          ),
          Visibility(
            visible: _selectedIndex == 2,
            child: const ShowPets(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color.fromARGB(232, 231, 214, 214),
      ),
    );
  }
}
