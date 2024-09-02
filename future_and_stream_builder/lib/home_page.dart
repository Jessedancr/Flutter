import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0; // To be used by stream builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('H O M E P A G E'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _futureBuilder(),
            const SizedBox(height: 20),
            _streamBuilder(),
          ],
        ),
      ),
    );
  }

  // FUTURE BUILDER
  Widget _futureBuilder() {
    return Center(
      child: FutureBuilder<int>(
        future: futureMethod(10),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('Future builder: ${snapshot.data}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<int>? futureMethod(int num) async {
    await Future.delayed(const Duration(seconds: 5));
    return num * num;
  }

  // STREAM BUILDER
  Widget _streamBuilder() {
    return Center(
      child: StreamBuilder(
        stream: stream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Text('Stream Builder: ${snapshot.data}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Stream stream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield _counter++;
    }
  }
}
