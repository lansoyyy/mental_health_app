import 'package:flutter/material.dart';
import 'package:mental_health_app/screens/home_screen.dart';
import 'package:mental_health_app/utils/colors.dart';
import 'package:mental_health_app/widgets/text_widget.dart';

import '../widgets/button_widget.dart';

class SecondaryHomeScreen extends StatefulWidget {
  const SecondaryHomeScreen({super.key});

  @override
  State<SecondaryHomeScreen> createState() => _SecondaryHomeScreenState();
}

class _SecondaryHomeScreenState extends State<SecondaryHomeScreen> {
  final List<String> emotions = [
    'Calm',
    'Happy',
    'Loved',
    'Peaceful',
    'Hopeful',
    'Grateful',
    'Content',
    'Optimistic',
    'Balanced',
    'Accepted',
    'Productive'
  ];

  // List to keep track of selected items
  List<String> selectedEmotions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            text: 'Choose the emotion that make you feel Good',
            fontSize: 24,
            maxLines: 3,
            fontFamily: 'Bold',
            color: Colors.black,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 50),
            child: TextWidget(
              text: 'Select atleast 1 emotion',
              fontSize: 14,
              fontFamily: 'Regular',
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0, // Space between chips
              children: emotions.map((emotion) {
                return ChoiceChip(
                  label: Text(emotion),
                  selected: selectedEmotions.contains(emotion),
                  onSelected: (isSelected) {
                    setState(() {
                      isSelected
                          ? selectedEmotions.add(emotion)
                          : selectedEmotions.remove(emotion);
                    });
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ButtonWidget(
            fontSize: 14,
            textColor: Colors.white,
            color: Colors.blue,
            label: 'Continue',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
        ],
      ),
    );
  }
}
