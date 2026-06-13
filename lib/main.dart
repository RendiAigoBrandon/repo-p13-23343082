import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/item_viewmodel.dart';
import 'views/item_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ItemViewModel()..fetchItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MVVM Item List',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
        ),
        home: const ItemListView(),
      ),
    );
  }
}
