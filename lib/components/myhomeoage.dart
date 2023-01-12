// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'comments.dart';
import 'details.dart';
import 'linkevents.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageList = [];
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.close),
        ),
        title: const Text(
          'New Diary',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                    ),
                    const Text('Location name')
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Add to Site Diary',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        CupertinoIcons.question_circle_fill,
                        color: Colors.grey,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 400,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                    ],
                  ),
                  height: 400,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Add photos to site diary'),
                            ),
                          ],
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.file(
                                        File(_imageList[index].path),
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: 3,
                                        right: 5,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _imageList.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 25,
                                            decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  imageSelect();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color.fromARGB(213, 165, 209, 35),
                                    ),
                                    height: 60,
                                    width: 300,
                                    child: const Center(
                                        child: Text(
                                      'Add a photo',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Include in photo gallery'),
                            Row(
                              children: [
                                Checkbox(
                                    checkColor: Colors.white,
                                    activeColor:
                                        const Color.fromARGB(213, 165, 209, 35),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    })
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 180,
            child: const Comments(),
          ),
          Container(
            height: 300,
            child: const Details(),
          ),
          Container(
            height: 222,
            //color: Colors.blue,
            child: const LinkEvents(),
          ),
          Column(
            children: [
              Container(
                height: 100,
                child: Column(
                  children: [
                    // link to web services to post data //
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(213, 165, 209, 35),
                        ),
                        height: 60,
                        width: 300,
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void imageSelect() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      _imageList.add(selectedImage);
    }
    setState(() {});
  }
}
