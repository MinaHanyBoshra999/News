import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/Home/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news/features/Home/presentation/manager/news_cubit/news_states.dart';
import 'package:news/features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:news/features/Home/presentation/views/widgets/news_widget.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (BuildContext context, state) {
        if (state is NewsSucessState) {
          return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 12),
              itemCount: state.newsList.length,
              itemBuilder: (BuildContext context, int index) {
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NewsWidget(newsModel: state.newsList[index],),
                );
              },
            ),
          );
        }else if(state is NewsFailuerState){
          return Text(state.errMessage);
        }else{
         return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 12),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NewsLoadingWidget(),
                );
              },
            ),
          );
    
    
        }
    
    
      },
    );
  }
}