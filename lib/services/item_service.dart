import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/item_model.dart';

class ItemService {
  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com/todos';

  Future<List<ItemModel>> fetchItems() async {
    final uri = Uri.parse(_baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .take(20)
          .map((json) => ItemModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Gagal mengambil data item');
    }
  }
}
