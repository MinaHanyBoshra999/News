import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/core/utlis/app_text_styles.dart';
import 'package:news/features/Home/data/models/news_model.dart';
import 'package:news/features/Home/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news/features/Home/presentation/manager/news_cubit/news_states.dart';
import 'package:news/features/Home/presentation/views/widgets/news_list_view.dart';
import 'package:shimmer/shimmer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {



  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).getNews(topic: 'bitcoin');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
        const Text(
            'Discover News',
            style: AppTextStyles.bold24,
          ),
           const   SizedBox(height: 16,),
          TopicsListView(),
          const  NewsListView(),


         

            


        ],
      ),
    );
  }
}

class TopicsListView extends StatefulWidget {
   const TopicsListView({
    super.key,
  });

  @override
  State<TopicsListView> createState() => _TopicsListViewState();
}

class _TopicsListViewState extends State<TopicsListView> {
  final List<String> topicsList=[
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: topicsList.length,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(40),
                color: Colors.black
            ),
            child: GestureDetector(

              onTap: () {
                BlocProvider.of<NewsCubit>(context).getNews(topic: topicsList[index]);
              },
              child: Center(child: Text(topicsList[index],style: const TextStyle(color: Colors.white),)))),
        );
      },),
    );
  }
}

class NewsLoadingWidget extends StatelessWidget {
  const NewsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(24)),
      child: Shimmer.fromColors(
         baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              decoration: const BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)  ),),
              height: 200,
              
            ),
          
            const SizedBox(height: 16,),
            Container(
                  height: 23,
                  width: MediaQuery.of(context).size.width *0.75,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5),borderRadius: BorderRadius.circular(5)),
                ),  
                                const SizedBox(height: 16,),
                     
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
          Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width *0.3,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5),borderRadius: BorderRadius.circular(5)),
                  
                ),  
          
          
          
               Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width *0.3,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5),borderRadius: BorderRadius.circular(5)),
                ),  
          
          
                    ],
                  ),     
                         
                         const SizedBox(height: 16,),
          
                    Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.grey.withOpacity(0.5)),
                    ),    
                                                     const SizedBox(height: 16,),
          
                        ],),
        ),
      ),
    
    );
  }
}






// SizedBox(
//                   width: double.infinity,
//                   height: 200,
//                   child: Stack(
//                     children: [
//                       Image.network(newsModel.urlToImage?? 'https://media.wired.com/photos/668d715c9004df7e67a59acd/191:100/w_1280,c_limit/Silicon-Valley-Trump-Biden-Politics.jpg',),
//                        ClipRRect(
//                       borderRadius:   const BorderRadius.only(
//                   topLeft: Radius.circular(24), topRight: Radius.circular(24)),
//                          // Clip it cleanly. 
//                        child: BackdropFilter(
//                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                             child: Container(
//                               color: Colors.grey.withOpacity(0.1),
//                               alignment: Alignment.center,
//                               child:  CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 );











// const SizedBox(
                //   width: double.infinity,
                //   height: 200,
                //   child:  Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),));