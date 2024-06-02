class ArticleEntity{
  const ArticleEntity({
    this.id = '',
    this.title = '',
    this.publicationDate = '',
    this.imageUrl = '',
    this.readed = false,
    this.description = '',
  });

  final String id;
  final String title;
  final String publicationDate;
  final String imageUrl;
  final bool readed;
  final String description;
  final String daysAgo;
}