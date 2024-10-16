import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitterclone/models/post_model.dart';
import 'package:twitterclone/services/database/database_provider.dart';
import 'package:twitterclone/widgets/my_bottom_sheet.dart';
import 'package:twitterclone/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PROVIDERS
  // This DB provider is for executing functions. It doesn't listen for changes
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);
  // Listening provider to listen for changes
  late final listeningProvider = Provider.of<DatabaseProvider>(context);

  // Text Controllers
  final postController = TextEditingController();

  // On startup, we're gonna load all the posts in the initial state
  @override
  void initState() {
    super.initState();
    loadAllPosts();
  }

  // Load all posts from firebase
  Future<void> loadAllPosts() async {
    await databaseProvider.loadAllPosts();
  }

  // Method to open up bottom sheet to post a message
  void _postMessageBox() {
    showBottomSheet(
      context: context,
      builder: (context) => MyBottomSheet(
        onTaptext: 'Post',
        hintText: 'Type a message',
        textController: postController,
        onTap: () async {
          // Post in DB
          await postMessage(postController.text);
        },
      ),
    );
  }

  // Post message to firebase
  Future<void> postMessage(String postContent) async {
    await databaseProvider.postMessage(postContent);
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('H O M E'),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: _postMessageBox,
        child: const Icon(Icons.add),
      ),

      // Body: this is where we'll have the list of posts
      body: _buildPostList(listeningProvider.allPosts),
    );
  }

  Widget _buildPostList(List<UserPostModel> posts) {
    return posts.isEmpty
        ? const Center(
            child: Text('Nothing here...'),
          )
        : ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              // Get each individual post
              final post = posts[index];

              // Return the post tile UI
              return Container(
                child: Text(post.postContent),
              );
            },
          );
  }
}
