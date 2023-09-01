class News {
  String? newsId;
  String? title;
  String? content;
  String? category;
  String? image;
  String? author;
  String? authorProfile;
  String? createdAt;

  News({
    this.newsId,
    this.title,
    this.content,
    this.category,
    this.image,
    this.author,
    this.authorProfile,
    this.createdAt,
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
