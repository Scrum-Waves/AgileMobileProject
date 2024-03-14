import '../../../general/consts/consts.dart';

  // Jedidi add Getx
class TotalAppointmentcontroller extends GetxController {
    // Jedidi add Getx
  var docName = ''.obs;
  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments() async {
    return FirebaseFirestore.instance
        .collection('appointments')
        .where(
          'appBy',
          isEqualTo: FirebaseAuth.instance.currentUser?.uid,
        )
        .get();
  }
}
