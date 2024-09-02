import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitterclone/schemas/user_schema.dart';

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
  Future<void> saveUserInfo({required String name, required String email}) async {
    // get current user
    final uid = _auth.currentUser!.uid;

    // Extract username from email
    // Implement another way to create username
    String username = email.split('@')[0];

    // Create user profile
    final user = UserProfileSchema(
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
  Future<UserProfileSchema?> getUserInfo({required String uid}) async {
    try {
      // Get user from firebase
      DocumentSnapshot userDoc = await _db.collection('users').doc(uid).get();

      // Convert doc to user profile
      UserProfileSchema user = UserProfileSchema.fromDocument(userDoc);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
