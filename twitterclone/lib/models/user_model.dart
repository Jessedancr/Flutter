import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * USER PROFLIE
 * 
 * This is basically a schema for the user profile collection
 * It is what every user would have in their profile
 * 
 * uid
 * name
 * username
 * bio
 * email
 */

class UserProfileModel {
  final String uid;
  final String name;
  final String username;
  final String bio;
  final String email;
  UserProfileModel({
    required this.uid,
    required this.name,
    required this.username,
    required this.bio,
    required this.email,
  });

  /**
   * Convert firbase doc to user profile using the cloud firestore package
   */
  factory UserProfileModel.fromDocument(DocumentSnapshot doc) {
    return UserProfileModel(
      uid: doc['uid'],
      bio: doc['bio'],
      email: doc['email'],
      name: doc['name'],
      username: doc['username'],
    );
  }

  /**
   * Convert user profile to firebase doc
   */
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "username": username,
      "bio": bio,
      "email": email,
    };
  }
}
