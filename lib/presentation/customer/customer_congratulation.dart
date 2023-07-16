import 'package:buchi/components/different/bottom_navigation.dart';
import 'package:buchi/components/header/header.dart';
import 'package:flutter/material.dart';

class CustomerCongratulation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congratulation",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 44,
                  color: Color.fromARGB(98, 99, 56, 56),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "We will setup a meeting with your companion soon:)",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text("Browse for more", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
