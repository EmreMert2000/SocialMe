import 'package:flutter/material.dart';
import 'package:socialme/Screens/ProfileScreen.dart';
import 'package:socialme/Screens/AddFeelScreen.dart';


class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ANA SAYFA'),
      ),
      body: Container(
        color: Colors.greenAccent,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddFeelScreen()),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
