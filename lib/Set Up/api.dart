import 'dart:convert';
import 'package:flutter_crud/Set%20Up/model_api.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Product>> getAllProduct() async {
    Uri url = Uri.parse(
        "https://rest-api-mongoexpress.vercel.app/api/v1/products?page=3");

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
    Uri url =
        Uri.parse("https://rest-api-mongoexpress.vercel.app/api/v1/products");

    http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'price': price,
        }));

    return jsonDecode(response.body);
  }
}
