import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ));
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: const Center(
                child: Text("Get All Product"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
