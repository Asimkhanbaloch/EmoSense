import 'package:flutter/material.dart';
import 'Main_Home.dart';
class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add your app logo or banner here
              Image.asset('assets/logo.png', height: 150, width: 150),
              SizedBox(height: 20),

              Text(
                'Welcome to EmoSense - Where Emotions Speak Louder Than Words!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              Text(
                'At EmoSense, we believe in the power of emotions and the profound impact they have on our daily lives. Our Flutter Emotion Recognition App is designed to revolutionize the way we connect with ourselves and others by harnessing the potential of cutting-edge technology.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                'Our Vision:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Empowering individuals to express, understand, and connect through the language of emotions.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                'Who We Are:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'At the heart of EmoSense is a passionate team of developers, designers, and psychologists who share a common goal – to bridge the gap between technology and human emotion. We are driven by the belief that emotional intelligence is key to fostering meaningful connections and enhancing overall well-being.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                'What Sets Us Apart:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'State-of-the-Art Technology: Our app utilizes advanced emotion recognition algorithms powered by Flutter to accurately detect and interpret a wide range of emotions.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'User-Centric Design: We understand the importance of a seamless user experience. Our app is designed with simplicity and accessibility in mind, ensuring that everyone can effortlessly navigate and utilize its features.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Privacy and Security: Your emotional well-being is personal, and so is your data. We prioritize the highest standards of security and privacy to ensure that your emotional journey remains yours alone.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                'Key Features:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Real-Time Emotion Recognition: Capture and analyze your emotions in real-time using the power of facial recognition technology.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Personalized Insights: Receive personalized insights and suggestions based on your emotional patterns, fostering self-awareness and personal growth.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Emotion Sharing: Connect with friends and loved ones by sharing your emotions in a unique and expressive way.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Journaling and Reflection: Keep track of your emotional journey through journaling features, promoting self-reflection and emotional well-being.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                'Join Us on This Emotional Journey:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Whether youre seeking a deeper understanding of your own emotions or looking to connect with others on a more profound level, [Your App Name] is here for you. Together, let\'s explore the fascinating world of emotions and unlock the true potential of human connection.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                'Welcome to a new era of emotional intelligence. Welcome to EmoSense.',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20),

              // Customize the button text and functionality
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainHome()));
                },
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
