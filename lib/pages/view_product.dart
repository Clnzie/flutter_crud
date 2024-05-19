import 'package:flutter/material.dart';
import 'package:flutter_crud/Set%20Up/api.dart';
import 'package:flutter_crud/Set%20Up/model_api.dart';
import 'package:flutter_crud/pages/add_product.dart';
import 'package:flutter_crud/pages/homepage.dart';
import 'package:flutter_crud/pages/update_product.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  List<Product> _list = [];
  ApiService apiService = ApiService();
  bool isLoading = false;
  getData() async {
    _list = await apiService.getAllProduct();
    print(_list);
    setState(() {});
  }
  // Future<void> _handleRefresh() async {
  //   List<Product> newData = await apiService.getAllProduct();

  //   setState(() {
  //     _list = newData;
  //   });
  // }

  deleteData(String slug) async {
    apiService.deleteProduct(slug);
    getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                            builder: (context) => const HomePage(),
                          ));
                    },
                    icon: const Icon(Icons.keyboard_backspace_rounded)),
                const Text(
                  "Todo - List",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _list.length,
            itemBuilder: (context, index) {
              var item = _list[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProduct(slug: item.slug),
                      ));
                },
                title: Text(item.name),
                subtitle: Text(item.price.toString()),
                leading: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Delete Product"),
                          content:
                              const Text("Are you sure delete this product?"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  deleteData(item.slug);
                                  getData();
                                },
                                child: const Text("Yes"))
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete_rounded)),
              );
            }),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProduct(),
                  ));
              getData();
            },
            label: const Text("Post"),
            icon: const Icon(Icons.post_add_rounded)),
      ),
    );
  }

  // _deleteProduct(String slug) {
  //   setState(() {
  //     apiService.deleteProduct(slug);
  //   });
  // }
}

// FutureBuilder<List<Product>>(
//           future: _getproduct,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Text("Error: ${snapshot.error}");
//             } else {
//               return ListView.builder(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   var item = snapshot.data![index];
//                   return ListTile(
//                     title: Text(item.name),
//                     subtitle: Text(item.price.toString()),
//                     leading: IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.delete_rounded)),
//                   );
//                 },
//               );
//             }
//           },
//         )