import 'package:flutter/material.dart';
import 'register_page.dart'; // Import RegisterPage
import 'landing_page.dart';


class LoginPage extends StatelessWidget {
  final VoidCallback onLoginClick;

  LoginPage({required this.onLoginClick});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image6.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Form Card
          Center(
            child: Card(
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the Landing Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LandingPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button color
                      ),
                      child: Text("Login"),
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Navigate to RegisterPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage(
                            onRegisterClick: () {
                              print("Registration completed");
                              Navigator.pop(context); // Go back to LoginPage
                            },
                          )),
                        );
                      },
                      child: Text("Don't have an account? Register"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
