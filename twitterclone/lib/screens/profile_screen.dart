import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitterclone/models/user_model.dart';
import 'package:twitterclone/services/auth/auth_service.dart';
import 'package:twitterclone/services/database/database_provider.dart';
import 'package:twitterclone/widgets/my_bio_box.dart';
import 'package:twitterclone/widgets/my_bottom_sheet.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({
    super.key,
    required this.uid,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Text controller to edit bio
  final _bioController = TextEditingController();

  // providers
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  // user info
  UserProfileModel? user;
  String currentUserid = AuthService().getCurrentUid();

  bool _isLoading = true; // because this screen is gonna take a while to load

  // For when this screen first loads
  @override
  void initState() {
    super.initState();

    // Load user info
    loadInfo();
  }

  //  THIS FUNCTION FETCHES THE USER INFO FROM THE DB
  Future<void> loadInfo() async {
    user = await databaseProvider.userProfile(widget.uid);

    // Finished loading
    setState(() {
      _isLoading = false;
    });
  }

  // BOTTOM SHEET TO UPDATE BIO
  void _editBioBox() {
    _bioController.text = user?.bio ?? '';
    showModalBottomSheet(
      context: context,
      builder: (context) => MyBottomSheet(
        hintText: 'Input Bio..',
        textController: _bioController,
        onTap: updateBio,
        onTaptext: 'Save',
      ),
    );
  }

  // FUNCTION TO UPDATE BIO
  Future<void> updateBio() async {
    setState(() {
      _isLoading = true;
    });

    // Update bio
    await databaseProvider.updateUserBio(_bioController.text);

    // Calliing the loadUser func
    await loadInfo();

    setState(() {
      _isLoading = false;
    });
    debugPrint('Bio updated');
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(_isLoading ? '' : user!.name),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: [
            // Username handle
            Center(
              child: Text(
                _isLoading ? '' : '@${user!.username}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Profile picture
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(20),
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Profile stats -> no of following, followers, posts

            // Follow/unfollow button

            // Edit bio
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Edit bio',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: _editBioBox,
                  child: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),

            // Bio box
            MyBioBox(bioText: _isLoading ? '...' : user!.bio),

            // List of posts from user
          ],
        ),
      ),
    );
  }
}
