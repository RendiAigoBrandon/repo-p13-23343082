import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/item_viewmodel.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ItemViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item MVVM'),
        actions: [
          IconButton(
            onPressed: () => context.read<ItemViewModel>().fetchItems(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _buildBody(viewModel),
    );
  }

  Widget _buildBody(ItemViewModel viewModel) {
    switch (viewModel.state) {
      case ViewState.loading:
        return const Center(child: CircularProgressIndicator());

      case ViewState.error:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              viewModel.errorMessage,
              textAlign: TextAlign.center,
            ),
          ),
        );

      case ViewState.success:
        return ListView.builder(
          itemCount: viewModel.items.length,
          itemBuilder: (context, index) {
            final item = viewModel.items[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(item.id.toString()),
                ),
                title: Text(item.title),
                trailing: Icon(
                  item.completed
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: item.completed ? Colors.green : Colors.grey,
                ),
              ),
            );
          },
        );

      case ViewState.idle:
        return const Center(child: Text('Belum ada data'));
    }
  }
}
