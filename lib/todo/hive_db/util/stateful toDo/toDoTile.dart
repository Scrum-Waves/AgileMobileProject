import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatefulWidget {
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

  //bool big = false;
  @override
  _ToDoTileState createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  bool big = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                widget.deleteFunction!(context);
              }, //,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade50,
              borderRadius: BorderRadius.circular(12),
            )
          ]),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                big = false;
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    content: Container(
                      height: (big == true) ? double.infinity : 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      big = !big;
                                      print(big);
                                    });

                                    (ctx as Element).markNeedsBuild();

                                    //Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.aspect_ratio),
                                ),
                                IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
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
                                Text(
                                  widget.taskName,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  textAlign: TextAlign.justify,
                                  widget.taskDescription,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Text("Done"),
                                  ),
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
                    value: widget.taskCompleted,
                    onChanged: widget.onChanged,
                    activeColor: Colors.teal,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.taskName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: widget.taskCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                        if (!widget.taskCompleted) ...[
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            widget.taskCompleted ? "" : widget.taskDescription,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                decoration: widget.taskCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                        ]
                      ],
                    ),
                  ),
                  if (!widget.taskCompleted) ...[
                    IconButton(
                      color: Colors.black87,
                      onPressed: () {
                        widget.updateTask!(widget.index);
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
