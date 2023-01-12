// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final List<String> date = ['date 1', 'date 2', 'date 3'];
  final List<String> area = ['area 1', 'area 2', 'area 3'];
  final List<String> task = ['task 1', 'task 2', 'task 3'];
  final _textController = TextEditingController();
  String? selectedDate;
  String? selectedArea;
  String? selectedTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      //color: Colors.blue,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.blue.withOpacity(0.3),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    'Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Container(
                      height: 50,
                      width: 400,
                      //color: Colors.green,
                      child: DropdownButton<String?>(
                        hint: const Text('dates'),
                        iconSize: 20,
                        icon: const Icon(
                          CupertinoIcons.chevron_down,
                        ),
                        value: selectedDate,
                        isExpanded: true,
                        items: date.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                          () => selectedDate = value,
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 400,
                        //color: Colors.green,
                        child: DropdownButton(
                          hint: const Text('select area'),
                          iconSize: 20,
                          icon: const Icon(
                            CupertinoIcons.chevron_down,
                          ),
                          value: selectedArea,
                          isExpanded: true,
                          items: area.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(
                            () => selectedArea = value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 400,
                        //color: Colors.green,
                        child: DropdownButton(
                          hint: const Text('Task category'),
                          iconSize: 20,
                          icon: const Icon(
                            CupertinoIcons.chevron_down,
                          ),
                          value: selectedTask,
                          isExpanded: true,
                          items: task.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(
                            () => selectedTask = value,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 400,
                            // color: Colors.green,
                            child: TextField(
                              cursorColor: Colors.black,
                              controller: _textController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                fillColor: Colors.black,
                                hintText: 'Tags',
                                suffix: IconButton(
                                  onPressed: () {
                                    _textController.clear();
                                  },
                                  icon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 15.0),
                                    child: const Icon(
                                      Icons.clear,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String Item) => DropdownMenuItem(
        value: Item,
        child: Text(
          Item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
