import 'package:flutter/material.dart';
import 'package:mental_health_app/screens/secondary_home_screen.dart';
import 'package:mental_health_app/utils/colors.dart';
import 'package:mental_health_app/widgets/text_widget.dart';

import '../widgets/button_widget.dart';

class InitialHomeScreen extends StatelessWidget {
  const InitialHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            text: 'How are you feeling now?',
            fontSize: 32,
            fontFamily: 'Bold',
            color: Colors.black,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 50),
            child: TextWidget(
              text:
                  'Select the mood that reflects the most how you are feeling at the moment',
              fontSize: 14,
              fontFamily: 'Regular',
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                fontSize: 14,
                width: 150,
                textColor: Colors.white,
                color: Colors.blue,
                label: 'Awesome',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondaryHomeScreen()));
                },
              ),
              ButtonWidget(
                fontSize: 14,
                width: 150,
                textColor: Colors.white,
                color: Colors.blue,
                label: 'Good',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondaryHomeScreen()));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                fontSize: 14,
                width: 150,
                textColor: Colors.white,
                color: Colors.blue,
                label: 'Neutral',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondaryHomeScreen()));
                },
              ),
              ButtonWidget(
                fontSize: 14,
                width: 150,
                textColor: Colors.white,
                color: Colors.blue,
                label: 'Bad',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondaryHomeScreen()));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ButtonWidget(
            fontSize: 14,
            width: 150,
            textColor: Colors.white,
            color: Colors.blue,
            label: 'Terrible',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SecondaryHomeScreen()));
            },
          ),
        ],
      ),
    );
  }
}
