import 'package:news/features/Home/data/models/news_model.dart';

abstract class NewsStates{}




class NewsInitialState extends NewsStates{}
class NewsLoadingState extends NewsStates{}
class NewsSucessState extends NewsStates{
  final List<NewsModel> newsList;

  NewsSucessState({required this.newsList});
}
class NewsFailuerState extends NewsStates{
  final String errMessage;
  NewsFailuerState({required this.errMessage});
}