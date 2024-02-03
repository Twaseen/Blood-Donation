// post.dart
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String username;
  final String postText;

  const Post({required this.username, required this.postText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(postText),
          SizedBox(height: 16),
          // Add comments section here
          // ...

          // Add a button to add comments
          ElevatedButton(
            onPressed: () {
              // Add logic to open comment screen
            },
            child: Text('Add Comment'),
          ),
        ],
      ),
    );
  }
}