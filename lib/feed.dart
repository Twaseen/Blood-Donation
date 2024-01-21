// feed.dart
import 'package:flutter/material.dart';
import 'post.dart';

class FeedScreen extends StatelessWidget {
  final List<Post> posts = [
    Post(username: 'User1', postText: 'This is post 1.'),
    Post(username: 'User2', postText: 'This is post 2.'),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return posts[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add logic to open post creation screen
        },
        child: Icon(Icons.post_add),
      ),
    );
  }
}