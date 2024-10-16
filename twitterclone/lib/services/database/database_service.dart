import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:twitterclone/models/post_model.dart';
import 'package:twitterclone/models/user_model.dart';
import 'package:twitterclone/services/auth/auth_service.dart';

/**
 * THIS CLASS WOULD HANDLE ALL THE DATA FROM AND TO FIREBASE
 * 
 * It has methods for \
 * - User profile
 * - Post messages
 * - Likes
 * - Comments
 * - Follow/unfollow
 * - Search users
 */

class DatabaseService {
  // Instance of firestore db and auth
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  /**
   * USER PROFILE
   * When a user creates an acct,
   * we save the details to the db so we can display it in the app
   * To do this we have two methods: saveUserInfo and getUserInfo
   */
  Future<void> saveUserInfo({
    required String name,
    required String email,
  }) async {
    // get current user
    final uid = _auth.currentUser!.uid;

    // Extract username from email
    // Implement another way to create username
    String username = email.split('@')[0];

    // Create user profile
    final user = UserProfileModel(
      uid: uid,
      name: name,
      username: username,
      bio: "",
      email: email,
    );

    // Convert user details into a map to store it in db
    final userMap = user.toMap();

    // Save user info in firebase
    await _db.collection('users').doc(uid).set(userMap);
  }

  // Get user info from firebase
  Future<UserProfileModel?> getUserInfo({required String uid}) async {
    try {
      // Get user from firebase
      DocumentSnapshot userDoc = await _db.collection('users').doc(uid).get();

      // Convert doc to user profile
      UserProfileModel user = UserProfileModel.fromDocument(userDoc);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // METHOD TO UPDATE USER BIO
  Future<void> updateUserBio(String bio) async {
    String uid = AuthService().getCurrentUid();

    // Attempt to update user bio
    try {
      await _db.collection('users').doc(uid).update({'bio': bio}); // DB query
    } catch (e) {
      debugPrint('error updating user bio: $e');
    }
  }

  // METHOD TO POST A MESSAGE
  Future<void> postMessageInFirebase(String postContent) async {
    try {
      //  Get current user's uid
      String uid = _auth.currentUser!.uid;

      // Use this uid to get the user's profile
      UserProfileModel? user = await getUserInfo(uid: uid);

      // Create a new post
      UserPostModel newPost = UserPostModel(
        id: '', // Firebase will auto generate this
        uid: uid,
        username: user!.username,
        name: user.name,
        postContent: postContent,
        likeCount: 0,
        likedBy: [],
        timeStamp: Timestamp.now(),
      );

      // Convert post object to map
      Map<String, dynamic> postMap = newPost.toMap();

      // Add it to firestore
      await _db.collection('Posts').add(postMap);
    } catch (e) {
      debugPrint('Error posting tweet: $e');
    }
  }

  // METHOD TO GET MESSAGE FROM FIREBASE
  Future<List<UserPostModel>> getAllPostFromFirebase() async {
    try {
      // Accessing the posts collection

      CollectionReference postsCollection = _db.collection('Posts');

      // ordering the posts in chronological order
      Query orderedPosts =
          postsCollection.orderBy('timeStamp', descending: true);

      // Getting the posts
      QuerySnapshot getPosts = await orderedPosts.get();
      return getPosts.docs
          .map((doc) => UserPostModel.fromDocument(doc))
          .toList();
    } catch (e) {
      debugPrint('Error getting all posts from firebase: $e');
      return [];
    }
  }
}
