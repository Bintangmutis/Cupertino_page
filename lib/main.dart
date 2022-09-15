import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return CupertinoApp(
        theme: const CupertinoThemeData(
            brightness: Brightness.light, primaryColor: Colors.black),
        home: const TampilAlertDialog());
  }
}

class TampilAlertDialog extends StatefulWidget {
  const TampilAlertDialog({Key? key}) : super(key: key);

  @override
  State<TampilAlertDialog> createState() => _TampilAlertDialogState();
}

class _TampilAlertDialogState extends State<TampilAlertDialog> {
  int pilihIndex = 0;

  @override
  void initState() {
    pilihIndex = 0;
    super.initState();
  }

  List<Widget> dataBody = [
    // ignore: prefer_const_constructors
    Text(
      "Home",
      // ignore: prefer_const_constructors
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    // ignore: prefer_const_constructors
    const Text(
      "Nama : Aloysius Odilio Bintang Mutis      "
      "Kampus : UPN Veteran Jatim",
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          wordSpacing: 2,
          height: 2),
      textAlign: TextAlign.center,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: const Icon(
            Icons.emoji_emotions,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {},
        ),
        backgroundColor: Color.fromARGB(255, 242, 53, 255),
        middle: const Text(
          "Apps Cupertino Widget",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              CupertinoIcons.search_circle_fill,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 22,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              CupertinoIcons.person_fill,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 22,
            )
          ],
        ),
      ),
      child: Center(
          child: CupertinoTabScaffold(
              backgroundColor: Colors.white,
              tabBar: CupertinoTabBar(
                  backgroundColor: Color.fromARGB(255, 242, 53, 255),
                  onTap: (nilai) {
                    pilihIndex = nilai;
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                          CupertinoIcons.profile_circled,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        label: "Profile"),
                  ]),
              tabBuilder: (context, index) {
                return CupertinoTabView(builder: (context) {
                  return Center(child: dataBody[pilihIndex]);
                });
              })),
    );
  }
}
