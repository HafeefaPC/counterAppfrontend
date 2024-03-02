import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'basic app',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0249A7),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 0), // Adjust spacing between images
                _buildRotatedImage(
                    'assets/images/hero1.jpg',
                    100,
                    100,
                    BoxFit.contain,
                    -0.4), // Rotate hero1 anticlockwise by 0.4 radians
                SizedBox(width: 50), // Adjust spacing between images
                _buildRotatedImage('assets/images/hero3.jpg', 100, 100,
                    BoxFit.cover, -.2), // No rotation for hero3
              ],
            ),
            SizedBox(height: 40), // Adjust spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 30), // Adjust spacing between images
                _buildRotatedImage(
                    'assets/images/hero3.jpg',
                    100,
                    100,
                    BoxFit.cover,
                    .4), // No rotation for hero3 (second occurrence)
                SizedBox(width: 30), // Adjust spacing between images
                _buildRotatedImage('assets/images/hero2.jpg', 200, 200,
                    BoxFit.cover, -0.3), // No rotation for hero2
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 50), // Adjust spacing between images and text
                  Text(
                    "Let's Get",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0), // Adjust spacing between images and text
                  Text(
                    "Started!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0), // Set the right margin to 60
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 20), // Adjust spacing between images and text
                  Text(
                    "A penny saved is a penny earned",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30,
                        right: 30), // Set the left and right margin to 20
                    child: SizedBox(
                      height: 50,
                      width: 600,
                      child: ElevatedButton(
                        onPressed: () {
                          print('');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the border radius
                          ),
                        ),
                        child: Text("Join Now",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          10), // Adjust spacing between the button and the text
                  TextButton(
                    onPressed: () {
                      // Navigate to the login page
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoginScreen()),
                      // );
                    },
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRotatedImage(
      String asset, double height, double width, BoxFit fit, double angle) {
    return Transform.rotate(
      angle:
          angle, // Angle in radians, negative for anticlockwise rotation, positive for clockwise rotation
      child: _buildRoundedImage(asset, height, width, fit),
    );
  }

  Widget _buildRoundedImage(
      String asset, double height, double width, BoxFit fit) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        asset,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
