import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:makeup/providers/makeup_providers.dart';
import 'package:makeup/widgets/makeup_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<MakeupProvider>(context, listen: false).fetchMakeup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MakeupProvider>(builder: (context, makeupConsumer, child) {
      return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 70,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.pinkAccent])),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.list),
                  color: Colors.pinkAccent),
              const Padding(
                padding: EdgeInsets.only(left: 360),
              ),
            ]),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text('Category',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontFamily: 'SawarabiMincho',
                          )),
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(30),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.5,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30),
                  itemBuilder: (context, index) {
                    return MakeupCard(
                        makeupModel: makeupConsumer.makeup[index]);
                  },
                  itemCount: makeupConsumer.makeup.length,
                ),
              ],
            ),
          ),
        ),

        //  SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.all(25.5),
        //     child: Column(
        //       children: [
        //         Row(
        //           children: [
        //             Text('Category',
        //                 style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 35,
        //                   fontFamily: 'SawarabiMincho',
        //                 )),
        //             GridView.builder(
        //               padding: const EdgeInsets.all(24),
        //               itemCount: makeupConsumer.isLoading
        //                   ? 20
        //                   : makeupConsumer.makeup.length,
        //               itemBuilder: (context, index) {
        //                 return AnimatedSwitcher(
        //                   duration: const Duration(milliseconds: 300),
        //                   child: makeupConsumer.isLoading
        //                       ? Container(
        //                           decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(16),
        //                               border: Border.all(color: Colors.white)),
        //                           child: Shimmer.fromColors(
        //                               baseColor: Colors.white,
        //                               highlightColor:
        //                                   Colors.white.withOpacity(0.2),
        //                               enabled: true,
        //                               child: Container(
        //                                 decoration: BoxDecoration(
        //                                     border: Border.all(
        //                                         color: Colors.black12,
        //                                         width: 0.5),
        //                                     color: Colors.white10,
        //                                     borderRadius:
        //                                         BorderRadius.circular(16)),
        //                                 child: child,
        //                               )),
        //                         )
        //                       : MakeupCard(
        //                           makeupModel: makeupConsumer.makeup[index],
        //                         ),
        //                 );
        //               },
        //               gridDelegate:
        //                   const SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisCount: 2,
        // childAspectRatio: 1 / 1.5,
        // mainAxisSpacing: 24,
        // crossAxisSpacing: 24),
        //             ),
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // ),

        bottomNavigationBar: Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
              child: GNav(
                  backgroundColor: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Colors.pinkAccent,
                  gap: 8,
                  onTabChange: (index) {
                    if (kDebugMode) {
                      print(index);
                    }
                  },
                  padding: const EdgeInsets.all(11),
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                      iconColor: Colors.black,
                    ),
                    GButton(
                      icon: Icons.shopping_bag,
                      text: 'My cart',
                      iconColor: Colors.black,
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'You',
                      iconColor: Colors.black,
                    ),
                  ]),
            )),
      );
    });
  }
}
