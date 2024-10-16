import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * USER POST MODEL
 * 
 * THIS MODEL DEFINES WHAT EVERY USERS' POST SHOULD HAVE
 */

class UserPostModel {
  final String id; // post id
  final String uid; // uid of poster
  final String username; // Username of poster
  final String name; // name of poster
  final String postContent; // Content of post
  final Timestamp timeStamp;
  final int likeCount; // amt of likes
  final List<String> likedBy; // List of people who liked the post

  UserPostModel({
    required this.id,
    required this.uid,
    required this.username,
    required this.name,
    required this.postContent,
    required this.likeCount,
    required this.likedBy,
    required this.timeStamp,
  });

  // Convert firestore doc to a post object to be used in the app
  factory UserPostModel.fromDocument(DocumentSnapshot doc) {
    return UserPostModel(
      id: doc.id,
      uid: doc['uid'],
      username: doc['username'],
      name: doc['name'],
      postContent: doc['postContent'],
      timeStamp: doc['timeStamp'],
      likeCount: doc['likeCount'],
      likedBy: List<String>.from(doc['LikedBy'] ?? []),
    );
  }

  // Convert post object to a map to be stored in firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'name': name,
      'postContent': postContent,
      'timeStamp': timeStamp,
      'likeCount': likeCount,
      'LikedBy': likedBy
    };
  }
}
