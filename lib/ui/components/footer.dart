import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function onExploreClick;
  final Function onSavedClick;
  final Function onContactClick;

  Footer({required this.onExploreClick, required this.onSavedClick, required this.onContactClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Color(0xFFABB88C), // Light green background
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _FooterItem(
            icon: Icons.location_on, // Placeholder for your location icon
            text: 'Explore Farm',
            onClick: onExploreClick,
          ),
          _FooterItem(
            icon: Icons.bookmark, // Placeholder for your saved icon
            text: 'Saved',
            onClick: onSavedClick,
          ),
          _FooterItem(
            icon: Icons.contact_mail, // Placeholder for your contact icon
            text: 'Contact Us',
            onClick: onContactClick,
          ),
        ],
      ),
    );
  }
}

class _FooterItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onClick;

  _FooterItem({required this.icon, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 25.0), // Icon size
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
