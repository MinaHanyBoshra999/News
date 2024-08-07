import 'package:news/features/Home/data/models/source_model.dart';

class NewsModel{
  String author;
  String title;
  String description;
  String url;
  String? urlToImage;
  String publishedAt;
  String content;
  SourceModel sourceModel;
  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt, 
    required this.content,
    required this.sourceModel
    });


  factory  NewsModel.fromJson(Map<String, dynamic> json){
      return NewsModel(author: json['author'] ?? '-', title: json['title'] ?? '-', description: json    ['description'] ?? '-', url: json['url'] ?? "https://dribbble.com/shots/20306034-Newz-News-App", urlToImage: json['urlToImage'], publishedAt: json['publishedAt'] ?? '0000-00-00T00:00:00' , content: json['content'] ?? '-', sourceModel: SourceModel.fromJson(json['source']));
    }



}