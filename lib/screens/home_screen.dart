import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/logout_widget.dart';
import '../widgets/text_widget.dart';
import 'auth/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          : null,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: TextWidget(
          text: 'Home',
          fontSize: 18,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout(context, const LoginScreen());
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.model_training),
            label: 'Seminar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Counselling',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
