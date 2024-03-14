import '../../../../doctor/general/consts/consts.dart';

// Jedidi add Getx
class ProfileController extends GetxController {
  @override
  void onInit() {
    getData = getUserData();
    // Jedidi add Getx
    super.onInit();
  }

  // Jedidi add Getx
  var isLoading = false.obs;
  var currentUser = FirebaseAuth.instance.currentUser;
  // Jedidi add Getx
  var username = ''.obs;
  // Jedidi add Getx
  var email = ''.obs;
  Future? getData;

  getUserData() async {
    isLoading(true);
    DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
        .instance
        .collection('doctors')
        .doc(currentUser!.uid)
        .get();
    var userData = user.data();
    username.value = userData!['docName'] ?? "";
    email.value = currentUser!.email ?? "";
    isLoading(false);
  }
}
