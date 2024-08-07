import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/core/helper_functions/formate_date.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/core/utlis/app_text_styles.dart';
import 'package:news/features/Home/presentation/views/news_details_view.dart';

import '../../../data/models/news_model.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key, required this.newsModel,
  });
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsView(newsModel: newsModel,))); 
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            ClipRRect(
      
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                child: CachedNetworkImage(imageUrl: newsModel.urlToImage ?? 'https://media.wired.com/photos/668d715c9004df7e67a59acd/191:100/w_1280,c_limit/Silicon-Valley-Trump-Biden-Politics.jpg',placeholder: (context, url) {
                  return  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ClipRRect(
                        borderRadius:   const BorderRadius.only(
                    topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                           // Clip it cleanly. 
                         child: BackdropFilter(
                         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                color: Colors.grey.withOpacity(0.1),
                                alignment: Alignment.center,
                                child:  const CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                              ),
                            ),
                          ),
                  );
                  
                },)
                
            
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsModel.title,
                    style: AppTextStyles.semiBold16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('by ${newsModel.author}',overflow:   TextOverflow.ellipsis,)),
                      Text(
                        foramteDate(newsModel.publishedAt),
                        style: AppTextStyles.regular13
                            .copyWith(color: AppColors.grayColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.lightGrayColor),
                    child: Text(newsModel.sourceModel.name),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}