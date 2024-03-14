import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../global/constants/utils/color_palette.dart';
import '../../../services/text_to_speech/tts.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final int index;
  final String taskName;
  final bool taskCompleted;
  final String taskDescription;
  Function(int?)? updateTask;
  Function(bool?)? onChanged;
  Function(BuildContext context)? deleteFunction;

  ToDoTile(
      {Key? key,
      required this.index,
      required this.taskName,
      required this.taskCompleted,
      required this.taskDescription,
      required this.updateTask,
      required this.onChanged,
      required this.deleteFunction})
      : super(key: key);

  bool big = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              foregroundColor: Theme.of(context).primaryTextTheme.button?.color,
              backgroundColor:
                  Theme.of(context).primaryTextTheme.headline1?.color ??
                      Colors.red.shade50,
              borderRadius: BorderRadius.circular(12),
            )
          ]),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryTextTheme.caption?.color,
                borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                big = false;
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    content: Container(
                      height: (big == true) ? double.infinity : 250,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    big = !big;
                                    (ctx as Element).markNeedsBuild();

                                    //Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.aspect_ratio),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.volume_off),
                                      color: muteColor,
                                      onPressed: () {
                                        TextToSpeech.stop();
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.volume_up),
                                      color: soundColor,
                                      onPressed: () {
                                        TextToSpeech.speak(taskName +
                                            ((taskDescription.length != 0)
                                                ? ". Description : " +
                                                    taskDescription
                                                : taskDescription));
                                      },
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  icon: Icon(Icons.close),
                                ),
                              ],
                            ),
                            /*Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: Icon(Icons.close),
                              ),
                            ),*/
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  child: AutoDirection(
                                    text: (taskName.toString().contains("AI: "))
                                        ? taskName.toString().substring(4)
                                        : taskName,
                                    child: SelectableText.rich(
                                      textAlign: TextAlign.justify,
                                      TextSpan(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(text: taskName),
                                          ]),
                                    ),
                                  ),
                                ),
                                /*Text(
                                  taskName,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),*/
                                SizedBox(height: 10),
                                AutoDirection(
                                  text: taskDescription,
                                  child: SelectableText.rich(
                                    textAlign: TextAlign.justify,
                                    TextSpan(children: [
                                      TextSpan(text: taskDescription)
                                    ]),
                                  ),
                                ),
                                /*Text(
                                  textAlign: TextAlign.justify,
                                  taskDescription,
                                ),*/
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.amber, // Background color
                                        ),
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text(
                                          "Done",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoDirection(
                            text: (taskName.toString().contains("AI: "))
                                ? taskName.toString().substring(4)
                                : taskName,
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                taskName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1
                                        ?.color,
                                    fontWeight: FontWeight.bold,
                                    decoration: taskCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                            )),
                        if (!taskCompleted) ...[
                          SizedBox(
                            height: 7,
                          ),
                          AutoDirection(
                            text: taskDescription,
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                taskCompleted ? "" : taskDescription,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1
                                      ?.color,
                                  decoration: taskCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                  if (!taskCompleted) ...[
                    IconButton(
                      color: Theme.of(context).primaryTextTheme.button?.color,
                      onPressed: () {
                        updateTask!(index);
                      },
                      icon: Icon(
                        Icons.edit,
                        semanticLabel: 'Edit Note',
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ));
  }
}
