import 'package:flutter/material.dart';

import '../../util/reels_pic.dart';

class Reels2 extends StatelessWidget {
  const Reels2({super.key});

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
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chat_bubble_outline_sharp),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
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
                      't3ssio',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Debut album on the way'),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.music_note,
                      color: Colors.white,
                    ),
                    Text(
                      't3ssio . Original audio',
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
