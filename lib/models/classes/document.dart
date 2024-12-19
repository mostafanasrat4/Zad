class Document{
  String id;
  String url;
  String? title;
  String? description;

  Document({
    required this.id,
    required this.url,
    this.title,
    this.description
  });

  factory Document.fromMap(Map<String, dynamic> map){
    return Document(
      id: map['id'] ?? '',
      url: map['url'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? ''
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'url': url,
      'title': title,
      'description' : description
    };
  }

}