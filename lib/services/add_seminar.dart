import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/const.dart';

Future addSeminar(date, venue, speaker, topic) async {
  final docUser = FirebaseFirestore.instance.collection('Appointments').doc();

  final json = {
    'date': date,
    'venue': venue,
    'speaker': speaker,
    'topic': topic,
    'id': docUser.id,
    'userId': userId,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
