import 'dart:math';

import 'package:flutter/foundation.dart';

import '../../../../global/constants/assets/assets_path.dart';
import '../../../../health/theme/light_color.dart';
import '../../../../ui/widgets/sidebar/drawer_all_widget.dart';
import '../../../../ui/widgets/sidebar/drawer_welcome_widget.dart';

import '../../../general/consts/consts.dart';

import '../../../general/list/home_icon_list.dart';
import '../../auth/controller/signup_controller.dart';

import '../../category/view/category_view.dart';
import '../../category_details/view/category_details.dart';
import '../../doctor_profile/view/doctor_view.dart';
import '../../search/controller/search_controller.dart';
import '../../search/view/search_view.dart';
import '../../total_appintment/view/total_appointment_view.dart';
import '../../widgets/coustom_textfield.dart';
import '../controller/home_controller.dart';
//
import '../../../doctor/app/auth/view/login_page.dart' as agent;
import '../../auth/view/login_page.dart' as user;

//
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../global/constants/assets/assets_path.dart';
import '../../../../global/constants/routes/routes.dart';
import '../../../../health/model/doctor_model.dart';
import '../../../../health/model/data.dart';
import '../../../../health/theme/light_color.dart';
import '../../../../health/theme/text_styles.dart';
import '../../../../health/theme/extention.dart';
import '../../../../health/theme/theme.dart';

//
import 'package:tasknow/medical/users/settings/controller/profile_controller.dart';

/*class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});*/
class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Jedidi add Getx
  var controler = Get.put(ProfileAgentController());
  // Jedidi add Getx
  var searchcontroller = Get.put(DocSearchController());

  late List<DoctorModel> doctorDataList;
  @override
  void initState() {
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
  }

  Widget _header() {
    return PaddingHelper(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hello,",
          style: TextStyles.title.subTitleColor,
        ),
        Text(controler.username.value.toString(), style: TextStyles.h1Style),
      ],
    )).p16;
  }

  Widget _searchField() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: LightColor.grey.withOpacity(.3),
            blurRadius: 15,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: TextField(
        controller: searchcontroller.searchQueryController,
        decoration: InputDecoration(
          icon: SizedBox(
              width: 50,
              child: Icon(Icons.person_search_sharp, color: LightColor.grey)),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          hintText: "Search medical agent",
          hintStyle: TextStyles.body.subTitleColor,
          suffixIcon: SizedBox(
            width: 50,
            child:
                Icon(Icons.search, color: LightColor.purple).alignCenter.ripple(
              () {
                // Jedidi add Getx
                Get.to(() => SearchView(
                      searchQuery: searchcontroller.searchQueryController.text,
                    ));
              },
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ),
      ),
    );
  }

  Widget _category() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Category", style: TextStyles.title.bold),
              Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "See All",
                    style: TextStyles.titleNormal
                        .copyWith(color: Theme.of(context).primaryColor),
                  ).ripple(() {
                    // Jedidi add Getx
                    Get.to(() => CategoryScreenn());
                  }))
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .28,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCardWidget(
                "Chemist & Drugist",
                "350 + Stores",
                color: LightColor.green,
                lightColor: LightColor.lightGreen,
              ),
              _categoryCardWidget(
                "Physio Specilist",
                "899 + Agents",
                color: LightColor.skyBlue,
                lightColor: LightColor.lightBlue,
              ),
              _categoryCardWidget(
                "Cardio. Specilist",
                "500 + Agents",
                color: LightColor.orange,
                lightColor: LightColor.lightOrange,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCardWidget(
    String title,
    String subtitle, {
    required Color color,
    required Color lightColor,
  }) {
    TextStyle titleStyle = TextStyles.title.bold.white;
    TextStyle subtitleStyle = TextStyles.body.bold.white;
    if (AppTheme.fullWidth(context) < 392) {
      titleStyle = TextStyles.body.bold.white;
      subtitleStyle = TextStyles.bodySm.bold.white;
    }
    return AspectRatio(
      aspectRatio: 6 / 8,
      child: Container(
        height: 280,
        width: AppTheme.fullWidth(context) * .3,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: lightColor.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -20,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 60,
                  ),
                ),
                PaddingHelper(Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(title, style: titleStyle).hP8,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      child: Text(
                        subtitle,
                        style: subtitleStyle,
                      ).hP8,
                    ),
                  ],
                )).p16
              ],
            ),
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _categoryCardWidget1(
    String title,
    String subtitle, {
    required Color color,
    required Color lightColor,
  }) {
    TextStyle titleStyle = TextStyles.title.bold.white;
    TextStyle subtitleStyle = TextStyles.body.bold.white;
    if (AppTheme.fullWidth(context) < 392) {
      titleStyle = TextStyles.body.bold.white;
      subtitleStyle = TextStyles.bodySm.bold.white;
    }
    return AspectRatio(
      aspectRatio: 6 / 8,
      child: Container(
        height: 280,
        width: AppTheme.fullWidth(context) * .3,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: lightColor.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -20,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 60,
                  ),
                ),
                PaddingHelper(Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(title, style: titleStyle).hP8,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      child: Text(
                        subtitle,
                        style: subtitleStyle,
                      ).hP8,
                    ),
                  ],
                )).p16
              ],
            ),
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _doctorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Agents", style: TextStyles.title.bold),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {})
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
      return _doctorTile(x);
    }).toList());
  }

  Widget _doctorTile(DoctorModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.asset(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(model.name, style: TextStyles.title.bold),
          subtitle: Text(
            model.type,
            style: TextStyles.bodySm.subTitleColor.bold,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ).ripple(
        () {
          Navigator.pushNamed(context, Routes.detailHealthPage,
              arguments: model);
        },
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    // Jedidi add Getx
    var controller = Get.put(HomeAgentController());
    // Jedidi add Getx
    var searchcontroller = Get.put(DocSearchController());
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerWelcome(context, controler.email.value.toString()),
          ListTile(
              leading: Icon(Icons.note_add_sharp, size: 35),
              title: Text(
                "Category",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                // Jedidi add Getx
                Get.to(() => CategoryScreenn());
              }),
          ListTile(
              leading: Icon(Icons.chat, size: 35),
              title: Text(
                "Appointement",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                // Jedidi add Getx
                // Jedidi add Getx
                Get.to(() => TotalAppointment());
                //BookAppointmentView
              }),
          const Divider(),
          ListTile(
              leading: Icon(Icons.volume_up, size: 35),
              title: Text(
                "Text To Speach",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.tts_page);
              }),
          ListTile(
              leading: Icon(Icons.campaign_sharp, size: 35),
              title: Text(
                "Speach To Text",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.stt_page);
              }),
          ListTile(
              leading: Icon(Icons.settings, size: 35),
              title: Text(
                "Theme",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.theme_page);
              }),
          const Divider(),
          ListTile(
              leading: Icon(Icons.logout, size: 35),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () async {
                SignupAgentController().signout();
                Get.offAll(() => const user.LoginView());
              }),
        ],
      )),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: (Theme.of(context).brightness.name == Brightness.light.name)
              ? Colors.grey
              : Colors.white,
        ),
        elevation: 0,
        //title: Row(children: [ AppString.welcome.text.make(), 5.widthBox,controler.username.value.text.make() ]),
        backgroundColor: Theme.of(context).colorScheme.background,
        /*leading: const Icon(
          Icons.short_text,
          size: 30,
          color: Colors.black,
        ),*/
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                SignupAgentController().signout();
                Get.offAll(() => agent.LoginView());
              },
              child: Icon(
                Icons.notifications_none,
                size: 30,
                color: LightColor.grey,
              )),
          Container(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              child: Container(
                // height: 40,
                // width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                child: Image.asset(Assets.userImage, fit: BoxFit.fill),
              ),
            ),
          ),
        ],
      ) as PreferredSizeWidget,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () => controler.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ///////////////////////////////////////////////////////////////////////////////////////////
                        _header(),
                        _searchField(),
                        _category(),

                        ///////////////////////////////////////////////////////////////////////////////////////////
                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                        ///

//search section

                        4.heightBox,
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 110,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: iconList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      //ontap for list
                                      onTap: () {
                                        // Jedidi add Getx
                                        Get.to(() => CategoryDetailsView(
                                            catName: iconListTitle[index]));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          //color: AppColors.greenColor,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              offset: Offset(4, 4),
                                              blurRadius: 10,
                                              color: LightColor.grey
                                                  .withOpacity(.2),
                                            ),
                                            BoxShadow(
                                              offset: Offset(-3, 0),
                                              blurRadius: 15,
                                              color: LightColor.grey
                                                  .withOpacity(.1),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              iconList[index],
                                              width: 50,
                                            ),
                                            5.heightBox,
                                            iconListTitle[index].text.make()
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              15.heightBox,
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8, right: 16, left: 16, bottom: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Medical Agents",
                                        style: TextStyles.title.bold),
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "See All",
                                          style: TextStyles.titleNormal
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                        ).ripple(() {
                                          // Jedidi add Getx
                                          Get.to(() => CategoryScreenn());
                                        }))
                                  ],
                                ),
                              ),
                              //Row(
                              //  mainAxisAlignment:
                              //      MainAxisAlignment.spaceBetween,
                              //  children: [
                              //    //populer doctors
                              //    Align(
                              //      alignment: Alignment.centerLeft,
                              //      child: "Medcal Agents"
                              //          .text
                              //          .color(AppColors.greenColor)
                              //          .size(AppFontSize.size16)
                              //          .make(),
                              //    ),
                              //    Align(
                              //      alignment: Alignment.centerRight,
                              //      child: GestureDetector(
                              //        onTap: () {},
                              //        child: Align(
                              //          alignment: Alignment.centerRight,
                              //          child: "View All"
                              //              .text
                              //              .color(AppColors.primeryColor)
                              //              .size(AppFontSize.size16)
                              //              .make(),
                              //          //TextStyles.titleNormal.copyWith(color: Theme.of(context).primaryColor)
                              //        ),
                              //      ),
                              //    ),
                              //  ],
                              //),
                              10.heightBox,
                              FutureBuilder<QuerySnapshot>(
                                future: controller.getDoctorList(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    var data = snapshot.data?.docs;
                                    return SizedBox(
                                      height: 195,
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: data?.length ?? 0,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Jedidi add Getx
                                              Get.to(() => DoctorProfile(
                                                    doc: data[index],
                                                  ));
                                            },
                                            child: Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                color: AppColors.bgDarkColor,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              margin: const EdgeInsets.only(
                                                  right: 8),
                                              height: 120,
                                              width: 130,
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Container(
                                                      color:
                                                          AppColors.greenColor,
                                                      child: Image.asset(
                                                        AppAssets.imgDoctor,
                                                        height: 130,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  data![index]['docName']
                                                      .toString()
                                                      .text
                                                      .size(AppFontSize.size16)
                                                      .make(),
                                                  data[index]['docCategory']
                                                      .toString()
                                                      .text
                                                      .size(AppFontSize.size12)
                                                      .make(),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        )

                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                        ///////////////////////////////////////////////////////////////////////////////////////////
                      ],
                    ),
                  ),
                  _doctorsList()
                ],
              ),
        /*Column(
                  children: [
                    
                  ],
                ),
             */
      ),
    );
  }
}
