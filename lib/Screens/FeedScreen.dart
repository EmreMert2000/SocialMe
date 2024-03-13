import 'package:flutter/material.dart';


class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed Activity'),
      ),
      body: Center(
        child: Text(
          'Hoş Geldiniz!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
