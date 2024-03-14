import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../todo/hive_db/data/databse.dart';
import '../../todo/hive_db/util/myBotton.dart';
import '../../todo/hive_db/util/toDoTile.dart';

import '../../global/constants/routes/routes.dart';
import '../../ui/widgets/sidebar/drawer_all_widget.dart';
import '../firebase_db/data_repo.dart';
import '../firebase_db/note_model.dart';
import '../firebase_db/notes_model.dart';

//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  // Obtain shared preferences.
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _mail = " ";

  //final List<String> _products = List.generate(100, (index) => "Product ${index.toString()}");
  // Jedidi add Reference Box
  final _myBox = Hive.box("SmartDoAI");

  //List of todo tasks
  ToDoDataBase db = ToDoDataBase();
  /*List toDoList = [
    ["Salem", false],
    ["Ahmed", false],
    ["test", true]
  ];*/

  //CRUD
  /*
  //Write data
  void writeData() {
    _myBox.put(1, "Jedidi");
    _myBox.put(2, ["Jedidi", 22]);
    //_myBox.
  }

  //Read data
  void readData() {
    print(_myBox.get(1));
  }

  //delete data
  void deleteData() {
    _myBox.delete(1);
  }
  */
/////////////////////////

  //Controller Add text
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  // ontap
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  // ontap
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updateDataBase();
  }

  updateTask(index) {
    showDialog(
        context: context,
        builder: (context) {
          controllerName.text = db.toDoList[index][1];
          controllerDescription.text = db.toDoList[index][3];
          return AlertDialog(
            content: Container(
              height: 300,
              child: Column(
                children: [
                  TextField(
                    controller: controllerName,
                    decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        hintText: "Edit Title"),
                    minLines: 1,
                    maxLines: 2,
                  ),

                  Expanded(
                    child: TextField(
                      controller: controllerDescription,
                      decoration: const InputDecoration(
                          //border: OutlineInputBorder(),
                          hintText: "Edit Description"),
                      minLines: 2,
                      maxLines: 10,
                    ),
                  ),
                  // Save + Cancel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      //Save Button
                      MyButton(
                          text: "Update",
                          onPressed: () {
                            setState(() {
                              /*db.toDoList.add([
                                controllerName.text,
                                false,
                                controllerDescription.text
                              ]);*/
                              //Update data
                              db.toDoList[index][1] = controllerName.text;
                              db.toDoList[index][3] =
                                  controllerDescription.text;
                              //Clear text
                              controllerName.clear();
                              controllerDescription.clear();
                              //Update database
                              db.updateDataBase();
                              //Close Dialog
                              Navigator.of(context).pop();
                              //Show SnackBar update
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Note updated!')));
                            });
                          }),

                      //Space
                      const SizedBox(
                        width: 40,
                      ),
                      //Cancel Button
                      MyButton(
                          text: "Cancel",
                          onPressed: () {
                            controllerName.clear();
                            controllerDescription.clear();

                            Navigator.of(context).pop();
                          })
                    ],
                  )
                ],
              ),
            ),
            title: const Text("Update the Note"),
          );
        });
  }

  // ontap
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          controllerName.text = "";
          controllerDescription.text = "";
          return GestureDetector(
              onTap: () {
                //FocusManager.instance.primaryFocus?.unfocus();
                FocusScope.of(context).unfocus();
              },
              child: AlertDialog(
                content: Container(
                  height: 300,
                  child: Column(
                    children: [
                      TextField(
                        controller: controllerName,
                        decoration: const InputDecoration(
                            //border: OutlineInputBorder(),
                            hintText: "Input Title"),
                        minLines: 1,
                        maxLines: 2,
                      ),

                      Expanded(
                        child: TextField(
                          controller: controllerDescription,
                          decoration: const InputDecoration(
                              //border: OutlineInputBorder(),
                              hintText: "Input Description"),
                          minLines: 2,
                          maxLines: 10,
                        ),
                      ),
                      // Save + Cancel
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          //Save Button
                          MyButton(
                              text: "Save",
                              onPressed: () {
                                //Add new task
                                setState(() {
                                  db.toDoList.add([
                                    if (db.toDoList.length == 0)
                                      0
                                    else
                                      db.toDoList
                                              .map((e) => e[0])
                                              .toList()
                                              .reduce((value, element) =>
                                                  value > element
                                                      ? value
                                                      : element) +
                                          1,
                                    controllerName.text,
                                    false,
                                    controllerDescription.text
                                  ]);
                                  print("Salem : ${db.toDoList}");
                                  //Clear text
                                  controllerName.clear();
                                  controllerDescription.clear();
                                  //Update database
                                  db.updateDataBase();
                                  //Close Dialog
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Note saved!')));
                                });
                              }),

                          //Space
                          const SizedBox(
                            width: 40,
                          ),
                          //Cancel Button
                          MyButton(
                              text: "Cancel",
                              onPressed: () {
                                controllerName.clear();
                                controllerDescription.clear();

                                Navigator.of(context).pop();
                              })
                        ],
                      )
                    ],
                  ),
                ),
                title: const Text("Create a new Note"),
              ));
        });
  }

  Future<void> TestLogin() async {
    final SharedPreferences prefs = await _prefs;
    String? email = prefs.getString("email");

    if (email == null) {
      Navigator.of(context).pushNamed(Routes.login_page);
    } else {
      setState(() {
        _mail = email /*!*/;
      });
    }
  }

  //Firebase
  final DataRepository repository = DataRepository();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    TestLogin();
    // 1st time the app is opened
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //Already existed data
      db.loadData();
    }
    db.updateDataBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              /*automaticallyImplyLeading: false,*/
              title: const Text("Notes"),
              elevation: 7,
              centerTitle: false,
              /*leading: IconButton(
                  icon: const Icon(Icons.accessibility),
                  color: Colors.yellowAccent,
                  onPressed: () {},
              ),*/
              actions: [
                Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: IconButton(
                      icon: Icon(Icons.download),
                      tooltip: "Download",
                      /*color: Colors.black87,*/
                      onPressed: () async {
                        ////////////////////////////////////////////////
                        ///////////////////////////////////Import
                        var temp;
                        await users.doc(_mail).get().then((value) {
                          //print(value.get("notes"));
                          temp = value;

                          ///
                          var L = [];

                          temp.data()['notes'].forEach(
                            (n) {
                              var T = [];
                              T.add(n['idnote']);
                              T.add(n['title'] as String);
                              T.add(n['completed'] as bool);
                              T.add(n['description'] as String);
                              if (T != []) {
                                L.add(T);
                              }
                            },
                          );
                          setState(() {
                            db.toDoList = L;
                            db.updateDataBase();
                          });

                          ///
                        }).catchError((e) => print("Failed"));

                        ////////////////////////////////////////////////
                      },
                    )),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.import_export),
                    tooltip: "Export",
                    onPressed: () async {
                      ////////////////////////////////////////////////
                      ///////////////////////////////////Export
                      // notes ID
                      var notesID = _mail;
                      //New notes
                      Notes notes = new Notes(notesID, notes: []);
                      for (var element in db.toDoList) {
                        //Add a note to Notes.notes
                        notes.notes.add(
                          Note(element[0],
                              title: element[1],
                              completed: element[2],
                              description: element[3]),
                        );
                      }
                      repository.addNewNotes(notes, context);

                      ///////////////////////////////////////////////
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: IconButton(
                      icon: Icon(Icons.message),
                      tooltip: "ChatBot",
                      /*color: Colors.black87,*/
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.speech_page);
                      },
                    ))
              ],
            ),
            drawer: DrawerAll(context, _mail, _prefs),
            floatingActionButton: /*buildSpeedDial()*/ FloatingActionButton(
              enableFeedback: false,
              onPressed: () {
                createNewTask();
              },
              child: const Icon(size: 27, Icons.add),
            ),
            body: ReorderableListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (BuildContext context, int index) {
                return ToDoTile(
                    key: ValueKey(db.toDoList[index][0]),
                    index: index,
                    taskName: db.toDoList[index][1],
                    taskCompleted: db.toDoList[index][2],
                    taskDescription: db.toDoList[index][3],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteFunction: (context) => deleteTask(index),
                    updateTask: (context) => updateTask(index));
              },
              //onReorder: (index, index) => (){},
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  //when moving down
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  //when moving up
                  final item = db.toDoList.removeAt(oldIndex);
                  //inserting the item in the new position
                  db.toDoList.insert(newIndex, item);
                  //updating the database
                  db.updateDataBase();
                });
              },
            )));
  }
}
