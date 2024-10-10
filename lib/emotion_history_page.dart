import 'package:flutter/material.dart';

class EmotionData {
  String emotionType;
  DateTime timestamp;

  EmotionData(this.emotionType, this.timestamp);
}

class EmotionHistoryPage extends StatefulWidget {
  final List<EmotionData> emotionHistory;

  EmotionHistoryPage({required this.emotionHistory});

  @override
  State<EmotionHistoryPage> createState() => _EmotionHistoryPageState();
}

class _EmotionHistoryPageState extends State<EmotionHistoryPage> {
  // Function to trigger a rebuild of the widget
  void updateUI() {
    setState(() {});
  }

  void addEmotionToHistory(String emotionType) {
    EmotionData emotionData = EmotionData(emotionType, DateTime.now());
    setState(() {
      widget.emotionHistory.add(emotionData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emotion History'),
      ),
      body: ListView.builder(
        itemCount: widget.emotionHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.emotionHistory[index].emotionType),
            subtitle: Text(widget.emotionHistory[index].timestamp.toString()),
          );
        },
      ),
    );
  }
}
