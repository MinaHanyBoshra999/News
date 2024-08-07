import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/features/Home/data/models/news_model.dart';
import 'package:news/features/Home/presentation/views/widgets/news_details_view_body.dart';

class NewsDetailsView extends StatelessWidget {

  const NewsDetailsView({super.key, required this.newsModel});
  final NewsModel newsModel;
  static const String routeName = "news_details_view";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundGrayColor,
      body: SafeArea(child: NewsDetailsViewBody(newsModel: newsModel,)),
    );
  }
}