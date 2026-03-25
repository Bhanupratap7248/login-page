import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Media'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          // Stories Section
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150',
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('User $index', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          // Posts
          PostWidget(
            userName: 'John Doe',
            userImage: 'https://via.placeholder.com/150',
            postTime: '2 hours ago',
            postContent: 'This is a sample post content. Enjoy your day!',
            postImage: 'https://via.placeholder.com/300',
          ),
          PostWidget(
            userName: 'Jane Smith',
            userImage: 'https://via.placeholder.com/150',
            postTime: '5 hours ago',
            postContent: 'Another post here. Flutter is awesome!',
            postImage: null,
          ),
          // Add more posts as needed
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}

class PostWidget extends StatefulWidget {
  final String userName;
  final String userImage;
  final String postTime;
  final String postContent;
  final String? postImage;

  const PostWidget({
    required this.userName,
    required this.userImage,
    required this.postTime,
    required this.postContent,
    this.postImage,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(widget.userImage)),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.postTime, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(widget.postContent),
            if (widget.postImage != null) ...[
              SizedBox(height: 10),
              Image.network(widget.postImage!),
            ],
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                Text('Like'),
                SizedBox(width: 20),
                IconButton(icon: Icon(Icons.comment), onPressed: () {}),
                Text('Comment'),
                SizedBox(width: 20),
                IconButton(icon: Icon(Icons.share), onPressed: () {}),
                Text('Share'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
