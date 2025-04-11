import 'dart:convert';
import 'package:f_app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> postList = [];

  Future<List<Post>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map<String, dynamic> i in data) {
        postList.add(Post.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  void initState() {
    super.initState();
    // No need to call getPostApi() here since FutureBuilder handles it
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 57, 117),
        title: const Center(
          child: Text(
            'Admin Dashboard',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_sharp),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure Column takes only needed space
          children: [
            // Welcome Card (Add if needed)
            FutureBuilder<List<Post>>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loading');
                } else {
                  return ListView.builder(
                    shrinkWrap: true, // Make ListView take only the space it needs
                    physics: const NeverScrollableScrollPhysics(), // Disable ListView's scrolling
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(snapshot.data![index].body),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}