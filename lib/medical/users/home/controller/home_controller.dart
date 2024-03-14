import '../../../general/consts/consts.dart';

// Jedidi add Getx
class HomeAgentController extends GetxController {
  // Jedidi add Getx
  var isLoading = false.obs;

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList() async {
    var doctors = FirebaseFirestore.instance.collection('doctors').get();
    return doctors;
  }
}
