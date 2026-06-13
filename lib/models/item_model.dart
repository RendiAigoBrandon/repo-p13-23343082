class ItemModel {
  final int id;
  final String title;
  final bool completed;

  ItemModel({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      completed: json['completed'] ?? false,
    );
  }
}
