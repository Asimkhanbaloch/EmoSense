import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _submitFeedback() {
    String email = emailController.text.trim();
    String feedback = feedbackController.text.trim();

    // Validate input before processing
    if (email.isEmpty && feedback.isEmpty) {
      // Show an error message if both email and feedback are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please provide either an email or feedback!')),
      );
      return;
    }

    // TODO: Add logic to send feedback to your server or process it locally.
    // You may want to validate the input before processing.

    // For now, simulate a server response with a delay
    Future.delayed(Duration(seconds: 2), () {
      // Show a confirmation message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted!')),
      );

      // Clear input fields after submission
      emailController.clear();
      feedbackController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Feedback or Report Issues'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We value your feedback!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              Text(
                'Please use the form below to submit your feedback or report any issues you may encounter. Your input is crucial in helping us improve the app.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Your Email (optional)',
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Feedback or Issues',
                  hintText: 'Type your feedback or report issues here...',
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submitFeedback,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
