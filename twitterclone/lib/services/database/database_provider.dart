import 'package:flutter/foundation.dart';
import 'package:twitterclone/models/post_model.dart';
import 'package:twitterclone/models/user_model.dart';

import 'package:twitterclone/services/database/database_service.dart';

/**
 * DATABASE PROVIDER
 * 
 * This provider is used to separate the firestore data handling from the UI
 * 
 * The DatabaseService class handles data coming to and from firebase
 * This provider would process this data to display in the app
 * 
 * This provider is needed to properly manage state of the different
 * screens of the app as it grows in size
 */

class DatabaseProvider extends ChangeNotifier {
  // SERVICES
  final _db = DatabaseService();

  // GET USER PROFILE WITH GIVEN ID
  Future<UserProfileModel?> userProfile(String uid) =>
      _db.getUserInfo(uid: uid);

  // Update user bio
  Future<void> updateUserBio(String bio) => _db.updateUserBio(bio);

  /**
   * POSTS
   */

  // local list of posts
  List<UserPostModel> _allPosts = [];

  // Getter method to get posts
  List<UserPostModel> get allPosts => _allPosts;

  // METHOD TO POST MESSAGE
  Future<void> postMessage(String postContent) async {
    // Post message in firebase
    await _db.postMessageInFirebase(postContent);

    // Reload data from firebase
    loadAllPosts();
  }

  // METHOD TO FETCH ALL POSTS
  Future<void> loadAllPosts() async {
    // Fetch all posts from firebase
    final allPosts = await _db.getAllPostFromFirebase();
    // Update local list of posts
    _allPosts = allPosts;
    // Update UI
    notifyListeners();
  }
}
