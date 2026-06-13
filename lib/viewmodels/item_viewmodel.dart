import 'package:flutter/foundation.dart';

import '../models/item_model.dart';
import '../services/item_service.dart';

enum ViewState {
  idle,
  loading,
  success,
  error,
}

// ViewModel bertugas mengelola state, mengambil data dari service,
// dan memberi notifikasi ke View ketika data berubah.
class ItemViewModel extends ChangeNotifier {
  final ItemService _service = ItemService();

  ViewState _state = ViewState.idle;
  List<ItemModel> _items = [];
  String _errorMessage = '';

  ViewState get state => _state;
  List<ItemModel> get items => _items;
  String get errorMessage => _errorMessage;

  Future<void> fetchItems() async {
    _state = ViewState.loading;
    _errorMessage = '';
    notifyListeners();

    try {
      _items = await _service.fetchItems();
      _state = ViewState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewState.error;
    }

    notifyListeners();
  }
}
