import 'package:flutter/material.dart';

import 'util/glass_box.dart';
import 'util/glass_box_data.dart';

double _appBarItemSize = 17;

class HomePage extends StatelessWidget {
  // LIST OF WEATHER DATA ITEMS
  final List weatherData = [
    ['Today', Icons.cloud, '26°/33°', 'Overcast'],
    ['Tomorrow', Icons.cloudy_snowing, '26°/33°', 'Showers'],
    ['Wednesday', Icons.cloud, '26°/33°', 'Overcast'],
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tinubu',
              style: TextStyle(fontSize: _appBarItemSize),
            ),
            Row(
              children: [
                Icon(
                  Icons.menu,
                  size: _appBarItemSize,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    'images/setting.png',
                    height: _appBarItemSize,
                    color: Colors.white,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Realism.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '28°',
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
              Text(
                'Overcast',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Text(
                  'Feels like 26° Southwest wind scale 2°',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),

              // GLASS BOX
              Stack(
                children: [
                  GlassBox(
                    height: 100.0,
                    width: double.infinity,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    leftPadding: 8.0,
                    rightPadding: 8.0,
                    topPadding: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 8,
                      ),
                      child: Row(
                        // ROW FOR CLOCK ICON AN TIME TEXT
                        children: [
                          // Clock Icon
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.white,
                          ),

                          // Sized box to separate clock icon and text
                          SizedBox(width: 5.0),

                          Text(
                            'Next 72 Hours',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // SUB GLASS BOX
                  Positioned(
                    bottom: 8.0,
                    left: 6.0,
                    right: 10.0,
                    top: 27.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GlassBox(
                          height: 30.0,
                          width: 90.0,
                          borderRadius: BorderRadius.circular(5.0),
                          leftPadding: 8.0,
                          rightPadding: 4.0,
                          topPadding: 8.0,
                          child: GlassBoxData(
                            day: weatherData[index][0],
                            weatherIcon: weatherData[index][1],
                            temperature: weatherData[index][2],
                            weatherComment: weatherData[index][3],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
