import 'package:flutter/material.dart';


class Navbar extends StatelessWidget {
  final Function onAboutClick;
  final Function onCartClick;

  Navbar({required this.onAboutClick, required this.onCartClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Color(0xFF55624C), // Background color for the navbar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Picture
          GestureDetector(
            onTap: () {
              // Navigate to profile screen
              Navigator.pushNamed(context, '/profile');
            },
            child: CircleAvatar(
              radius: 24.0,
              backgroundImage: AssetImage('assets/profile_picture.png'), // Profile image
            ),
          ),

          // Navigation Buttons
          Row(
            children: [
              _NavbarButton(text: 'Recipes', onClick: () {
                Navigator.pushNamed(context, '/browse_meal_kits');
              }),
              SizedBox(width: 6.0),
              _NavbarButton(text: 'About Us', onClick: () => onAboutClick()),
            ],
          ),

          // Cart Icon
          GestureDetector(
            onTap: () => onCartClick(),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 24.0,
            ),
          ),

          // Logo
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/landing_page');
            },
            child: Image.asset(
              'assets/logo.png', // Logo image
              width: 40.0, // Adjust logo size
            ),
          ),
        ],
      ),
    );
  }
}

class _NavbarButton extends StatelessWidget {
  final String text;
  final Function onClick;

  _NavbarButton({required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClick(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFD0D9C0)), // Button background color
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0)),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }
}
