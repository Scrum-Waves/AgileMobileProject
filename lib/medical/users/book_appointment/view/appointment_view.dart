import 'package:intl/intl.dart';

import '../../../general/consts/consts.dart';
import '../../widgets/coustom_button.dart';
import '../../widgets/coustom_textfield.dart';
import '../controller/book_appointment_controller.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docNum;
  final String docName;
  const BookAppointmentView({
    super.key,
    required this.docId,
    required this.docName,
    required this.docNum,
  });

  @override
  Widget build(BuildContext context) {
    // Jedidi add Getx
    var controller = Get.put(AppointmentAgentController());

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: AppColors.greenColor,
        title: docName.text.white.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: controller.formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Select Appointment date"
                    .text
                    .size(AppFontSize.size16)
                    .semiBold
                    .make(),
                /*CoustomTextField(
                  validator: controller.validdata,
                  textcontroller: controller.appDayController,
                  hint: "Select date",
                  icon: const Icon(Icons.calendar_month_outlined),
                ),*/
                TextField(
                    controller: controller.appDayController,
                    decoration: InputDecoration(
                        hintText: 'Select date',
                        icon: new Icon(Icons.calendar_month_outlined),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      //when click we have to show the datepicker
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(
                              1900), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(
                            pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                        print(
                            formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                        controller.appDayController.text =
                            formattedDate; //set foratted date to TextField value.
                      } else {
                        print("Date is not selected");
                      }
                    }),
                10.heightBox,
                "Select Appointment Time"
                    .text
                    .size(AppFontSize.size16)
                    .semiBold
                    .make(),
                /*CoustomTextField(
                  validator: controller.validdata,
                  textcontroller: controller.appTimeController,
                  hint: "Select time",
                  icon: const Icon(Icons.watch_later),
                ),*/
                TextField(
                    controller: controller.appTimeController,
                    decoration: InputDecoration(
                        hintText: 'Select time',
                        icon: new Icon(Icons.watch_later),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      //when click we have to show the datepicker
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(), //get today's date
                        builder: (BuildContext context, Widget? child) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child ?? Container(),
                          );
                        },
                      );

                      /*if (picked != null) {
                        print(
                            pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(
                            pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                        print(
                            formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                        controller.appDayController.text =
                            formattedDate; //set foratted date to TextField value.
                      } else {
                        print("Date is not selected");
                      }*/
                      if (picked != null) {
                        controller.appTimeController.text =
                            picked.hour.toString() +
                                ':' +
                                picked.minute.toString();
                      }
                    }),
                10.heightBox,
                "patient's name".text.size(AppFontSize.size16).semiBold.make(),
                CoustomTextField(
                  validator: controller.validdata,
                  textcontroller: controller.appNameController,
                  hint: "patient's full name",
                  icon: const Icon(Icons.person),
                ),
                10.heightBox,
                "Mobile Number".text.size(AppFontSize.size16).semiBold.make(),
                CoustomTextField(
                  validator: controller.validdata,
                  textcontroller: controller.appMobileController,
                  hint: "Enter patent mobile number",
                  icon: const Icon(Icons.call),
                ),
                10.heightBox,
                "Your problem".text.size(AppFontSize.size16).semiBold.make(),
                TextFormField(
                  controller: controller.appMessageController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.note_add),
                    hintText: "write your problem in short",
                    hintStyle: TextStyle(),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // Jedidi add Getx
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10),
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CoustomButton(
                  onTap: () async {
                    await controller.bookAppointment(
                        docId, docName, docNum, context);
                  },
                  title: "Confirm Appointment",
                ),
        ),
      ),
    );
  }
}
