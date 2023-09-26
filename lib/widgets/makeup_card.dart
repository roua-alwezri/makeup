import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:makeup/models/makeup_model.dart';
import 'package:makeup/screens/detailed_makeup_screen.dart';

class MakeupCard extends StatelessWidget {
  const MakeupCard({super.key, required this.makeupModel});

  final MakeupModel makeupModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print('IMAGE ${makeupModel.imageLink}');
        }
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailedMakeupScreen(
                      makeupModel: makeupModel,
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            GridTile(
              footer: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 224, 169, 187),
                  Color.fromARGB(0, 215, 115, 115)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        makeupModel.id.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        makeupModel.brand.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              child: Image.network(
                makeupModel.imageLink.toString(),
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  color: Colors.pink,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
