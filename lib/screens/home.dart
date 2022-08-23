import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Note App',
            style: TextStyle(
              color: Colors.purple,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Text(
                  'All Notes',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                icon: Text(
                  'Folders',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Icon(Icons.flight, size: 350),
          Icon(Icons.directions_transit, size: 350),
        ]),
      ),
    );
  }
}
