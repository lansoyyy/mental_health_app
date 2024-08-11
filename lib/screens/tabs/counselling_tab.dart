import 'package:cloud_firestore/cloud_firestore.dart';
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
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Counselling')
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
                  child: ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Center(
                          child: !data.docs[index]['isTaken']
                              ? ButtonWidget(
                                  label: data.docs[index]['time'],
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChatScreen()));
                                  },
                                )
                              : Banner(
                                  message: 'Already Taken',
                                  location: BannerLocation.topEnd,
                                  layoutDirection: TextDirection.ltr,
                                  child: ButtonWidget(
                                    label: data.docs[index]['time'],
                                    onPressed: () {},
                                  ),
                                ),
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
}
