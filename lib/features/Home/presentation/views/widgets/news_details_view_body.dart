import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/core/helper_functions/formate_date.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/core/utlis/app_text_styles.dart';
import 'package:news/features/Home/data/models/news_model.dart';

class NewsDetailsViewBody extends StatelessWidget {
  const NewsDetailsViewBody({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
      
      children: [
      
  
      Stack(
        children: [    
      CachedNetworkImage(
        height: 300,
        fit: BoxFit.cover,
        imageUrl: newsModel.urlToImage ?? 'https://media.wired.com/photos/668d715c9004df7e67a59acd/191:100/w_1280,c_limit/Silicon-Valley-Trump-Biden-Politics.jpg',placeholder: (context, url) {
                  return  SizedBox(
                    width: double.infinity,
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
                  
                },),
       Positioned(
         top: 20,
        left: 16,
         child: GestureDetector(
          onTap: () =>  Navigator.pop(context),
           child: Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.white),
            child: const Center(child: Icon(Icons.arrow_back_ios_new)),
           ),
         ),
       ), 
         ],
         ), 


         Padding(
           padding: const EdgeInsets.all(16),
           child: Column(
            children: [
              SizedBox(height: 32,),
                 Text(newsModel.title ?? '',style: AppTextStyles.bold24,),
                 SizedBox(height: 16,),
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
                 SizedBox(height: 16,),
                 Text(newsModel.description ?? '',style: AppTextStyles.regular16,),
            ],
           ),
         ),
      
      
      
      
      ],
      
      ),
    );
  }
}