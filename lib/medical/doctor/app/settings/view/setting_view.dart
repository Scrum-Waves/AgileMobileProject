import '../../../../doctor/general/consts/consts.dart';

import '../../auth/controller/signup_controller.dart';
import '../../auth/view/login_page.dart';
import '../../widgets/coustom_iconbutton.dart';
import '../controller/profile_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
      // Jedidi add Getx
    var controler = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: "Setting".text.white.make(),
      ),
        // Jedidi add Getx
      body: Obx(
        () => controler.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.imgLogin,
                        width: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: controler.username.value.text.make(),
                        ),
                      ),
                      10.heightBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: controler.email.value.text.make(),
                        ),
                      ),
                      20.heightBox,
                      const Divider(),
                      20.heightBox,
                      // CoustomIconButton(
                      //   color: AppColors.primeryColor,
                      //   onTap: () {},
                      //   title: "Change Password",
                      //   icon: const Icon(
                      //     Icons.lock,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      10.heightBox,
                      CoustomIconButton(
                        color: Colors.black.withOpacity(.4),
                        onTap: () {},
                        title: "Terms & Condition",
                        icon: const Icon(
                          Icons.edit_document,
                          color: Colors.white,
                        ),
                      ),
                      10.heightBox,
                      CoustomIconButton(
                        color: AppColors.redcolor,
                        onTap: () {
                          SignupController().signout();
                            // Jedidi add Getx
                          Get.offAll(() => const LoginView());
                        },
                        title: "Logout",
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
