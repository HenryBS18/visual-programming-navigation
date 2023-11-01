import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Codelab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [FirstScreen(), SecondScreen(), ThirdScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Codelab'),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Third',
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }

  void _updateCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

void onBottomNavItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstScreen()));
      break;
    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
      break;
    case 2:
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdScreen()));
      break;
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'App Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('First'),
            onTap: () {
              Navigator.pop(context);
              _onDrawerNavItemTapped(context, 0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Second'),
            onTap: () {
              Navigator.pop(context);
              _onDrawerNavItemTapped(context, 1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Third'),
            onTap: () {
              Navigator.pop(context);
              _onDrawerNavItemTapped(context, 2);
            },
          ),
          // Add more list items for other drawer options
        ],
      ),
    );
  }

  void _onDrawerNavItemTapped(BuildContext context, int index) {
    final MyHomePageState? myHomePageState = context.findAncestorStateOfType<MyHomePageState>();
    myHomePageState?._updateCurrentIndex(index);
  }
}
