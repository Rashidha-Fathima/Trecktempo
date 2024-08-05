import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Pages/Sign-In-Up/signIn.dart';
import 'package:travel_app/Pages/Sign-In-Up/Components/Button.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TrekTempo',
          style: TextStyle(
            fontFamily: 'ShortBaby',
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.175,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/SignUp-2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.5),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign up now',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please fill the details and create account',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 81, 80, 80),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(Icons.person, 'Username', const Color.fromARGB(255, 60, 60, 60)),
                  const SizedBox(height: 8),
                  _buildTextField(Icons.email, 'Email', const Color.fromARGB(255, 60, 60, 60)),
                  const SizedBox(height: 8),
                  _buildPasswordField(Icons.lock, 'Password', const Color.fromARGB(255, 60, 60, 60)),
                  const SizedBox(height: 8),
                  _buildPasswordField(Icons.lock, 'Confirm Password', const Color.fromARGB(255, 60, 60, 60)),
                  const SizedBox(height: 16),
                  Button(
                    text: 'Sign up',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color.fromARGB(255, 51, 96, 241),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Or connect',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle Google sign in
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/Connect-Google.png'),
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Facebook sign in
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/Connect-FB.png'),
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText, Color color) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 84, 84, 84)),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildPasswordField(IconData icon, String hintText, Color color) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        bool _isPasswordVisible = false;
        return TextField(
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.black),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Color.fromARGB(255, 84, 84, 84),
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Color.fromARGB(255, 84, 84, 84)),
            filled: true,
            fillColor: Colors.black.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        );
      },
    );
  }
}

void main() => runApp(MaterialApp(
  home: SignUpPage(),
));
