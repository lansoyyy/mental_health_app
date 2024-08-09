import 'package:flutter/material.dart';
import 'package:mental_health_app/widgets/button_widget.dart';
import 'package:mental_health_app/widgets/text_widget.dart';
import 'package:mental_health_app/widgets/textfield_widget.dart';

class SeminarTab extends StatefulWidget {
  const SeminarTab({super.key});

  @override
  State<SeminarTab> createState() => _SeminarTabState();
}

class _SeminarTabState extends State<SeminarTab> {
  final venue = TextEditingController();
  final speaker = TextEditingController();
  final topic = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Schedule of Seminars',
            fontSize: 16,
            fontFamily: 'Bold',
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Date',
                        fontSize: 16,
                        fontFamily: 'Bold',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: ButtonWidget(
                          label: 'Date here',
                          onPressed: () {
                            addSeminarDialog();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  addSeminarDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldWidget(
                    label: 'Venue',
                    controller: venue,
                  ),
                  TextFieldWidget(
                    label: 'Speaker',
                    controller: speaker,
                  ),
                  TextFieldWidget(
                    maxLine: 5,
                    label: 'Topic',
                    controller: topic,
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
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen()),
                    // );
                  },
                  child: const Text(
                    'Set Appointment',
                    style: TextStyle(
                        fontFamily: 'QRegular', fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ));
  }
}
