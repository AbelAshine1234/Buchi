import 'package:flutter/material.dart';

class BrandPage extends StatelessWidget {
  const BrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            TopPart(),
            BottomPart(),
          ],
        ),
      ),
    );
  }
}

class TopPart extends StatelessWidget {
  const TopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    const text = 'Over 200,000 STRAY DOGS ON Addis Ababa Streets in 2020!';

    return Container(
      height: screenHeight / 2,
      color: const Color.fromARGB(255, 235, 224, 224),
      child: Stack(
        children: [
          Image(
            width: screenWidth,
            height: screenHeight / 2,
            image: const NetworkImage(
              'http://64.226.105.205:9000/buchi/static/photos/41ca9a55c27f339a9799e26e9952ccb3.png',
            ),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: text
                  .split(' ')
                  .map((word) => Text(
                        word,
                        style: const TextStyle(
                          fontSize: 48,
                          color: Color.fromARGB(255, 87, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: h / 2,
      color: const Color.fromARGB(255, 235, 224, 224),
      child: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Be part of the solution",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Adopt a stray pet to decrease the number of stray pets on the street for the safety of everyone",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Start your journey of finding your companion now using the Buchi app",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 87, 69, 69),
                  radius: 60,
                  child: Icon(
                    Icons.search,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}