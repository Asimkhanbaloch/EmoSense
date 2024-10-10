import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'emotion_history_page.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';

class ImageEmotionPage extends StatefulWidget {
  @override
  _ImageEmotionPageState createState() => _ImageEmotionPageState();
}

class _ImageEmotionPageState extends State<ImageEmotionPage> {
  late ImagePicker _imagePicker;
  String _output = '';
  File? _pickedImage;
  List<EmotionData> emotionHistory = [];

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    // Load the model when the page is initialized
    _loadModel();
  }

  // Load the TFLite model
  Future<void> _loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  // Run the model on the selected image
  Future<void> _getImageAndDetectEmotion() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    // Get the path of the selected image
    String imagePath = image.path;

    // Run the model on the selected image
    var predictions = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 1,
    );

    if (predictions != null && predictions.isNotEmpty) {
      // Extract emotion label and confidence score
      String emotionLabel = predictions[0]['label'];
      double confidence = predictions[0]['confidence'];

      // Example: Set the detected emotion with percentage to _output
      setState(() {
        _output = '$emotionLabel (${(confidence * 100).toStringAsFixed(2)}%)';
        addEmotionToHistory(_output);
      });
    }

    // Set the picked image
    setState(() {
      _pickedImage = File(imagePath);
    });
  }

  addEmotionToHistory(String emotionType) {
    EmotionData emotionData = EmotionData(emotionType, DateTime.now());
    setState(() {
      emotionHistory.add(emotionData);
    });
  }

  @override
  void dispose() {
    // Release resources when the page is disposed
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Emotion Detection'),
      ),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // Image
            Positioned(
              top: 12,
              child: _pickedImage != null
                  ? Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.file(
                    _pickedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              )
                  : Container(),
            ),
            // Output Text
            Positioned(
              bottom: 200, // Adjust the bottom value to your preference
              child: Text(
                _output,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
            ),
            // Button
            Positioned(
              bottom: 20,
              child: ElevatedButton(
                onPressed: _getImageAndDetectEmotion,
                child: Text('Choose Image'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
