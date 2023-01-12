// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkEvents extends StatefulWidget {
  const LinkEvents({super.key});

  @override
  State<LinkEvents> createState() => _LinkEventsState();
}

class _LinkEventsState extends State<LinkEvents> {
  final List<String> event = ['event 1', 'event 2', 'event 3'];
  String? selectedEvent;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 222,
        width: 400,
        // color: Colors.blue,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    color: Colors.blue.withOpacity(0.3),
                  ),
                ],
              ),
              height: 180,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 400,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Link to existing event?',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                        Checkbox(
                            checkColor: Colors.white,
                            activeColor: Color.fromARGB(213, 165, 209, 35),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            })
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        child: DropdownButton<String?>(
                          // ignore: prefer_const_constructors
                          hint: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Select an event'),
                          ),
                          iconSize: 20,
                          icon: const Icon(
                            CupertinoIcons.chevron_down,
                          ),
                          value: selectedEvent,
                          isExpanded: true,
                          items: event.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(
                            () => selectedEvent = value,
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
