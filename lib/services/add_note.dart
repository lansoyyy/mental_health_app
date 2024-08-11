import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/const.dart';

Future addNote(title, note) async {
  final docUser = FirebaseFirestore.instance.collection('Notes').doc();

  final json = {
    'title': title,
    'note': note,
    'id': docUser.id,
    'userId': userId,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
