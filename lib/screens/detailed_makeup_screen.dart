import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:makeup/models/makeup_model.dart';
import 'package:makeup/providers/makeup_providers.dart';
import 'package:provider/provider.dart';

class DetailedMakeupScreen extends StatefulWidget {
  const DetailedMakeupScreen({super.key, required this.makeupModel});
  final MakeupModel makeupModel;
  @override
  State<DetailedMakeupScreen> createState() => _DetailedMakeupScreenState();
}

class _DetailedMakeupScreenState extends State<DetailedMakeupScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          elevation: 0,
          toolbarHeight: 70,
          iconTheme: const IconThemeData(color: Colors.pinkAccent),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white, Colors.pinkAccent])),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(widget.makeupModel.imageLink)),
                  ),
                  const Positioned(
                    top: 50,
                    right: 50,
                    child: Padding(
                      padding: EdgeInsets.all(34.0),
                    ),
                  ),
                ],
              ),
              if (widget.makeupModel.name.toString().toString() != "null")
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(widget.makeupModel.name.toString()),
                  ],
                ),
              if (widget.makeupModel.price.toString().toString() != "null")
                Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'PRICE',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 20,
                      fontFamily: 'SawarabiMincho',
                    ),
                  ),
                  Text(widget.makeupModel.price.toString()),
                ]),
              if (widget.makeupModel.description.toString().toString() !=
                  "null")
                Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'DESCRIPTION',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 20,
                      fontFamily: 'SawarabiMincho',
                    ),
                  ),
                  Text(widget.makeupModel.description.toString()),
                ]),
              TextButton(
                onPressed: () => null,
                child: Text('Add To Cart'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
              ),
            ]),
          ),
        )));
  }
}
