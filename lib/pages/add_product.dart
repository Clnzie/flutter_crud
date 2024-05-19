import 'package:flutter/material.dart';
import 'package:flutter_crud/Set%20Up/api.dart';
import 'package:flutter_crud/pages/view_product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  TextEditingController priceProductController = TextEditingController();
  TextEditingController nameProductController = TextEditingController();
  ApiService apiService = ApiService();

  // Future _addProduct() async {
  //   try {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const MainPage(),
  //         ));

  //     var poduct = await apiService.createProduct(nameProductController.text,
  //         int.tryParse(priceProductController.text) ?? 0);
  //     print("asdas $poduct");

  //     if (poduct) {
  //       return true;
  //     }

  //     return false;
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewProduct(),
                      ));

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


// if (formKey.currentState!.validate()) {
//                     _addProduct().then((value) {
//                       if (value) {
//                         final snackBar = SnackBar(
//                             content: const Text('Product berhasil disimpan'));
//                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       } else {
//                         final snackBar = SnackBar(
//                             content: const Text('Product gagal disimpan'));
//                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       }
//                     });
//                   }