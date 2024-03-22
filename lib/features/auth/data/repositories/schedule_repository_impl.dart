// ignore_for_file: lines_longer_than_80_chars

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScheduleRepositoryImpl {
  ScheduleRepositoryImpl();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> addSchedule(
      String uid, Map<String, dynamic> addedschedule) async {
    try {
      await FirebaseFirestore.instance
          .collection('schedule')
          .doc(uid)
          .set(addedschedule);
      return 'Se pudo agregar schedule';
    } catch (e) {
      return 'No se pudo agregar schedule';
    }
  }

  Future<Map<String, dynamic>?> getSchedule(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('schedule').doc(uid).get();
    return snapshot.data();
  }

  Future<String> updateSchedule(
      String uid, Map<String, dynamic> scheduleFields) async {
    try {
      await FirebaseFirestore.instance
          .collection('schedule')
          .doc(uid)
          .update(scheduleFields);
      return 'Se cambio la informacion correctamente';
    } catch (e) {
      return 'No se encontro schedule';
    }
  }

  Future<String> deleteSchedule(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('schedule').doc(uid).delete();
      return 'Se elimino el schedule';
    } catch (e) {
      return 'No se encontro schedule';
    }
  }
}
