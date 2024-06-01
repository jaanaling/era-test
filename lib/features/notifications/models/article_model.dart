class ArticleModel {
  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  bool readed;
  final String? description;
  DateTime changeDate = DateTime.now();

  ArticleModel({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.readed = false,
    this.description,
  });
}
