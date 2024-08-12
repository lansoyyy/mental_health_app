import 'package:flutter/material.dart';
import 'package:mental_health_app/screens/tabs/counselling_tab.dart';
import 'package:mental_health_app/screens/tabs/journal_tab.dart';
import 'package:mental_health_app/screens/tabs/seminar_tab.dart';
import 'package:mental_health_app/services/add_note.dart';
import 'package:mental_health_app/widgets/textfield_widget.dart';

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
    const JournalTab(),
    const SeminarTab(),
    const CounsellingTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                addJournalDialog();
              },
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

  addJournalDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldWidget(
                    label: 'Title',
                    controller: title,
                  ),
                  TextFieldWidget(
                    label: 'Note',
                    controller: description,
                  ),
                ],
              ),
              actions: <Widget>[
                MaterialButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                        fontFamily: 'QRegular', fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                    addNote(title.text, description.text);
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen()),
                    // );
                  },
                  child: const Text(
                    'Add Note',
                    style: TextStyle(
                        fontFamily: 'QRegular', fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ));
  }
}
