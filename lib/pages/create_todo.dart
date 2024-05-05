import 'package:flutter/material.dart';
import 'package:flutter_crud/Set%20Up/api.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  TextEditingController priceProductController = TextEditingController();
  TextEditingController nameProductController = TextEditingController();
  ApiService apiService = ApiService();

  // product() async {
  //   try {
  //     Navigator.pop(context);
  //     var poduct = await apiService.createProduct(nameProductController.text,
  //         int.tryParse(priceProductController.text) ?? 0);
  //     print("asdas $poduct");
  //   } catch (e) {
  //     print("gagal gagal $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
            child: TextField(
              controller: nameProductController,
              cursorOpacityAnimates: true,
              decoration: InputDecoration(
                  hintText: "Name Porduct",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(136, 133, 133, 133)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
            child: TextField(
              controller: priceProductController,
              cursorOpacityAnimates: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Price Product",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(136, 133, 133, 133)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  var poduct = await apiService.createProduct(
                      nameProductController.text,
                      int.tryParse(priceProductController.text) ?? 0);
                  print("asdas $poduct");
                } catch (e) {
                  print("gagal gagal $e");
                }
              },
              child: const Text("Ditekan"),
            ),
          ),
        ],
      ),
    );
  }
}
