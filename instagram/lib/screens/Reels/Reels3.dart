import 'package:flutter/material.dart';

import '../../util/reels_pic.dart';

class Reels3 extends StatelessWidget {
  const Reels3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),

          // LIKE, COMMENT, SHARE, MORE, SOUND
          Positioned(
            right: 8.0,
            bottom: 10.0,
            child: Column(
              children: [
                Image.asset('images/heart_red.png', height: 24),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('images/chat_red.png', height: 23),
                ),
                Image.asset('images/send_red.png', height: 24),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.multitrack_audio_sharp),
                ),
              ],
            ),
          ),

          // USERNAME, CAPTION, AUDIO
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ReelsPic(),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Thecopywiz',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("How I earned \$100k with copywriting"),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.music_note,
                      color: Colors.white,
                    ),
                    Text(
                      'Thecopywiz . Original audio',
                      style: TextStyle(fontSize: 10.0),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
