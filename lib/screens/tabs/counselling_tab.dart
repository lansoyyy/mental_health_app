import 'package:flutter/material.dart';
import 'package:mental_health_app/screens/chat_screen.dart';
import 'package:mental_health_app/widgets/button_widget.dart';
import 'package:mental_health_app/widgets/text_widget.dart';
import 'package:mental_health_app/widgets/textfield_widget.dart';

class CounsellingTab extends StatefulWidget {
  const CounsellingTab({super.key});

  @override
  State<CounsellingTab> createState() => _CounsellingTabState();
}

class _CounsellingTabState extends State<CounsellingTab> {
  final venue = TextEditingController();
  final speaker = TextEditingController();
  final topic = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 25,
          ),
          TextWidget(
            text: 'Choose a time for\nyour consultation',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Center(
                    child: index % 2 != 0
                        ? ButtonWidget(
                            label: 'Time here',
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ChatScreen()));
                            },
                          )
                        : Banner(
                            message: 'Already Taken',
                            location: BannerLocation.topEnd,
                            layoutDirection: TextDirection.ltr,
                            child: ButtonWidget(
                              label: 'Time here',
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const ChatScreen()));
                              },
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
