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

class UserProfileSchema {
  final String uid;
  final String name;
  final String username;
  final String bio;
  final String email;
  UserProfileSchema({
    required this.uid,
    required this.name,
    required this.username,
    required this.bio,
    required this.email,
  });

  /**
   * Convert firbase doc to user profile using the cloud firestore package
   */
  factory UserProfileSchema.fromDocument(DocumentSnapshot doc) {
    return UserProfileSchema(
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
