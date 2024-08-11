import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health_app/utils/const.dart';
import 'package:mental_health_app/widgets/text_widget.dart';

class JournalTab extends StatelessWidget {
  const JournalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Notes')
            .where('userId', isEqualTo: userId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: data.docs[index]['title'],
                      fontSize: 16,
                      fontFamily: 'Bold',
                    ),
                    TextWidget(
                      text: data.docs[index]['note'],
                      fontSize: 12,
                      fontFamily: 'Regular',
                      color: Colors.grey,
                    ),
                  ],
                ),
                trailing: TextWidget(
                  text: DateFormat.yMMMd()
                      .add_jm()
                      .format(data.docs[index]['dateTime'].toDate()),
                  fontSize: 12,
                  fontFamily: 'Regular',
                  color: Colors.grey,
                ),
              );
            },
          );
        });
  }
}
