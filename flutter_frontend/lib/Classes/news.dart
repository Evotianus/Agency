class News {
  String newsId;
  String title;
  String content;
  String category;
  String image;
  String author;
  String authorProfile;
  String createdAt;

  News({
    required this.newsId,
    required this.title,
    required this.content,
    required this.category,
    required this.image,
    required this.author,
    required this.authorProfile,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'id': newsId,
        'title': title,
        'content': content,
        'category': category,
        'image': image,
        'author': author,
        'author_profile': authorProfile,
        'created_at': createdAt,
      };

  News.fromJson(Map<String, dynamic> json)
      : newsId = json['id'],
        title = json['title'],
        content = json['content'],
        category = json['category'],
        image = json['image'],
        author = json['author'],
        authorProfile = json['author_profile'],
        createdAt = json['created_at'];
}
