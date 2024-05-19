import 'dart:convert';
import 'package:flutter_crud/Set%20Up/model_api.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Product>> getAllProduct() async {
    Uri url = Uri.parse(
        "https://rest-api-mongoexpress.vercel.app/api/v1/products/?page=2");

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonRespon = jsonDecode(response.body) as Map<String, dynamic>;
      final respon = jsonRespon['data'] as List;
      return respon.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed fetch data');
    }

    // var respon = jsonDecode(response.body);

    // print(respon);
    // return respon;
  }

  Future createProduct(String name, int price) async {
    try {
      final Map<String, dynamic> body = {"name": name, "price": price};
      Uri url = Uri.parse(
          'https://rest-api-mongoexpress.vercel.app/api/v1/products/');

      http.Response response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(body));

      var result = jsonDecode(response.body);

      return result;
    } catch (e) {
      print("Error making post request $e ");
    }
  }

  Future deleteProduct(String slug) async {
    try {
      Uri url = Uri.parse(
          "https://rest-api-mongoexpress.vercel.app/api/v1/products/delete/$slug");

      http.Response response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        print("sukses delete");
        // return Product.empty();
      } else {
        throw Exception("Failed to delete Product");
      }
    } catch (e) {
      print("Error deleting Product $e");
    }
  }

  Future updateProduct(String slug, name, price) async {
    try {
      final Map<String, dynamic> body = {"name": name, "price": price};
      Uri url = Uri.parse(
          "https://rest-api-mongoexpress.vercel.app/api/v1/products/update/$slug");
      http.Response response = await http.put(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body));

      var result = jsonDecode(response.body);

      return result;
    } catch (e) {
      print("Error update Product");
    }
  }
}
