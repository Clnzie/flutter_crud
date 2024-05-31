import 'package:flutter/material.dart';
import 'package:flutter_crud/Set%20Up/api.dart';
import 'package:flutter_crud/pages/view_product.dart';

class UpdateProduct extends StatefulWidget {
  final String slug;
  const UpdateProduct({super.key, required this.slug});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final ApiService apiService = ApiService();
  final TextEditingController nameUpdateController = TextEditingController();
  final TextEditingController priceUpdateController = TextEditingController();
  String _response = '';

  Future<void> _updateData() async {
    try {
      Navigator.pop(context);
      var name = nameUpdateController.text;
      var price = int.tryParse(priceUpdateController.text) ?? 0;
      var response = await apiService.updateProduct(widget.slug, name, price);
      nameUpdateController.clear();
      priceUpdateController.clear();
      print(response);

      // setState(() {
      //   _response = response;
      // });
    } catch (e) {
      print("error update product $e");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 42),
        child: Container(
          alignment: Alignment.center,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewProduct(),
                        ));
                  },
                  icon: const Icon(Icons.keyboard_backspace_rounded)),
              Text(
                "Update - Product : ${widget.slug}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
            child: TextField(
              controller: nameUpdateController,
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
              controller: priceUpdateController,
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
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: ElevatedButton(
              onPressed: _updateData,
              child: const Text("Ditekan"),
            ),
          )
        ],
      ),
    );
  }
}
