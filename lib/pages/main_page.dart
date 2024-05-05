import 'package:flutter/material.dart';
import 'package:flutter_crud/Set%20Up/api.dart';
import 'package:flutter_crud/Set%20Up/model_api.dart';
import 'package:flutter_crud/pages/create_todo.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Product> _list = [];
  // late Future<List<Product>> getproduct;
  ApiService apiService = ApiService();
  bool isLoading = false;

  Future<void> _handleRefresh() async {
    List<Product> newData = await apiService.getAllProduct();

    setState(() {
      _list = newData;
    });
  }

  // getData() async {
  //   _list = await apiService.getAllProduct();
  //   setState(() {});
  // }

  @override
  void initState() {
    _handleRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo - List",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _list.length,
          itemBuilder: (context, index) {
            var item = _list[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toString()),
              leading: IconButton(
                  onPressed: () async {
                    await deleteProduct(item.id);
                  },
                  icon: const Icon(Icons.delete_rounded)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateTodoPage(),
                )).then((value) => setState(() {}));
          },
          label: const Text("Post"),
          icon: const Icon(Icons.post_add_rounded)),
    );
  }

  Future<void> deleteProduct(String id) async {
    try {
      Uri url = Uri.parse(
          "https://rest-api-mongoexpress.vercel.app/api/v1/products/$id");

      http.Response response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        print("sukses delete");
      } else {
        throw Exception("Failed to delete Product");
      }
    } catch (e) {
      print("Error deleting Product $e");
    }
  }
}
