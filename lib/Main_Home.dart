import 'package:flutter/material.dart';
import 'emotion_history_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'image_emotion_page.dart';
import 'live_emotion.dart';
import 'mood_boost_page.dart';
import 'settings_page.dart';
class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<EmotionData> emotionHistory = [];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmoSense'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add functionality for search
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.indigo],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      // Add logic if needed when the page changes
                    },
                  ),
                  items: [
                    'assets/de.jpg',
                    'assets/um.jpg',
                    'assets/history.jpg',
                  ].map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Adjust as needed
                          ),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Text(
                'EmoSense',
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  shrinkWrap: true,
                  children: [
            EmotionContainer(
                      imagePath: 'assets/de.jpg',
                      text: 'Detect Emotion',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LiveEmotion()));
                      },
                    ),
                    EmotionContainer(
                      imagePath: 'assets/history.jpg',
                      text: 'Emotion History',
                      onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmotionHistoryPage(emotionHistory: emotionHistory),
                            ),
                          );
                      },
                    ),
                    EmotionContainer(
                      imagePath: 'assets/um.jpg',
                      text: 'Detect Emotion Using Image',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ImageEmotionPage()));
                      },
                    ),
                    EmotionContainer(
                      imagePath: 'assets/mood.jpg',
                      text: 'More Features',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MoodBoostingContentPage(detectedEmotion: '',),));
                        // Add functionality for more features
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.indigo],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_placeholder.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'user@email.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            DrawerItem(icon: Icons.home, title: 'Home', onTap: () => Navigator.pop(context)),
            DrawerItem(icon: Icons.share, title: 'Share', /* onTap: () =>  Add functionality for share in drawer */),
            DrawerItem(icon: Icons.history, title: 'History', /* onTap: () =>  Add functionality for history in drawer */),
            DrawerItem(icon: Icons.settings, title: 'Settings',   onTap: () =>  Navigator.push(
                context, MaterialPageRoute(builder: (context) => SettingsPage(),))),
            DrawerItem(icon: Icons.logout, title: 'Logout', /* onTap: () =>  Add functionality for logout in drawer */),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [Icons.home, Icons.history, Icons.settings],
        activeIndex: _currentIndex,
        gapLocation: GapLocation.none,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (_currentIndex == 0) {
            // Navigate to Home
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainHome()));
          } else if (_currentIndex == 1) {
            // Navigate to Emotion History
            Navigator.push(context, MaterialPageRoute(builder: (context) => EmotionHistoryPage(emotionHistory: emotionHistory)));
          } else if (_currentIndex == 2) {
            // Navigate to Settings
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          }
        },
        activeColor: Colors.blue, // Change the active icon color
        inactiveColor: Colors.grey, // Change the inactive icon color
      ),
    );
  }
}


class EmotionContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const EmotionContainer({
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends ListTile {
  DrawerItem({IconData? icon, required String title, VoidCallback? onTap})
      : super(
    leading: Icon(icon),
    title: Text(title),
    onTap: onTap,
  );
}
