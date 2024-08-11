import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/const.dart';

Future addMessage(message, time) async {
  final docUser = FirebaseFirestore.instance
      .collection('Messages')
      .doc(DateTime.now().toString());

  final json = {
    'message': message,
    'time': time,
    'id': docUser.id,
    'userId': userId,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
