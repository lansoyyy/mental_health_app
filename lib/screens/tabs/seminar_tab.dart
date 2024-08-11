import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health_app/services/add_seminar.dart';
import 'package:mental_health_app/widgets/button_widget.dart';
import 'package:mental_health_app/widgets/text_widget.dart';
import 'package:mental_health_app/widgets/textfield_widget.dart';
import 'package:mental_health_app/widgets/toast_widget.dart';

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
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Seminars')
                  .orderBy('date', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return Expanded(
                  child: ListView.separated(
                    itemCount: data.docs.length,
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
                                label: DateFormat.yMMMd()
                                    .add_jm()
                                    .format(data.docs[index]['date'].toDate()),
                                onPressed: () {
                                  addSeminarDialog(data.docs[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }

  addSeminarDialog(data) {
    setState(() {
      venue.text = data['venue'];
      speaker.text = data['speaker'];
      topic.text = data['topic'];
    });
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldWidget(
                    enabled: false,
                    label: 'Venue',
                    controller: venue,
                  ),
                  TextFieldWidget(
                    enabled: false,
                    label: 'Speaker',
                    controller: speaker,
                  ),
                  TextFieldWidget(
                    enabled: false,
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
                    addSeminar(
                        data['date'], venue.text, speaker.text, topic.text);
                    Navigator.of(context).pop(true);

                    venue.clear();
                    speaker.clear();
                    topic.clear();

                    showToast('Appointment added succesfully!');
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
