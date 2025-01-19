import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the body with SingleChildScrollView to allow scrolling
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).brightness == Brightness.light
                    ? Color(0xFF727D73)  // Light green for light mode
                    : Color(0xFF677D6A),  // Dark green for dark mode
                Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFAAB99A)  // Lighter green for light mode
                    : Color(0xFF40534C),  // Darker green for dark mode
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              // Hardcoded Navbar
              Navbar(),

              // Main Image Section
              MainImageSection(),

              // Recipe Cards Section
              RecipeCardsSection(),

              // Popular Recipes Section
              PopularRecipesSection(),

              // Why Choose Us Section
              WhyChooseUsSection(),

              // Footer
              Footer(
                onExploreClick: () {},
                onSavedClick: () {},
                onContactClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          SizedBox(height: 50), // Add space to bring the navbar down
          Row(
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
                  backgroundImage: AssetImage('assets/images/profile_picture.jpg'), // Profile image
                ),
              ),

              // Navigation Buttons
              Row(
                children: [
                  _NavbarButton(text: 'Recipes', onClick: () {
                    Navigator.pushNamed(context, '/browse_meal_kits');
                  }),
                  SizedBox(width: 6.0),
                  _NavbarButton(text: 'About Us', onClick: () {
                    // Handle About Us button click
                  }),
                ],
              ),

              // Cart Icon
              GestureDetector(
                onTap: () {
                  // Handle Cart button click
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black, // Changed to black for better visibility
                  size: 24.0,
                ),
              ),

              // Logo
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/landing_page');
                },
                child: Image.asset(
                  'assets/images/logo.png', // Logo image
                  width: 40.0, // Adjust logo size
                ),
              ),
            ],
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

class MainImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15, // Making image section fit the screen height
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_image.png'),
          fit: BoxFit.cover, // Ensuring image covers the entire section
        ),
      ),
    );
  }
}

class RecipeCardsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          RecipeCard(),
          RecipeCard(),
          RecipeCard(),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Image with fixed height and width, adding BoxFit.cover for scaling
            Container(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/images/alfredo_pizza.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recipes to Fit Your Diet',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    'In seconds with us. Tailored meal plans.',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Browse Recipes
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Color(0xFFABB88C),
                    ),
                    child: Text("Browse Recipes"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularRecipesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Popular Recipes',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 8),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                RecipeCardWithTime(),
                RecipeCardWithTime(),
                RecipeCardWithTime(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeCardWithTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 100,
              child: Image.asset(
                'assets/images/healthy_bibimbap.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Healthy Bibimbap',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('30 mins'),
          ],
        ),
      ),
    );
  }
}

class WhyChooseUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color(0xFF40534C), // Vibrant green background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Why Choose Us',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white, // White text color for vibrancy
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• Fresh Ingredients', style: TextStyle(color: Colors.white)),
              Text('• Customizable Meal Plans', style: TextStyle(color: Colors.white)),
              Text('• Convenient Delivery', style: TextStyle(color: Colors.white)),
              Text('• Healthy Choices', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}

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
            icon: Icons.location_on, // Icon for explore
            text: 'Explore Farm',
            onClick: onExploreClick,
          ),
          _FooterItem(
            icon: Icons.bookmark, // Icon for saved
            text: 'Saved',
            onClick: onSavedClick,
          ),
          _FooterItem(
            icon: Icons.contact_mail, // Icon for contact
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
