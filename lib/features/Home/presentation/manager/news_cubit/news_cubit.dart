import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/Home/data/repos/home_repo.dart';
import 'package:news/features/Home/presentation/manager/news_cubit/news_states.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  

  getNews({required String topic})async{
   emit(NewsLoadingState());
    var result=await HomeRepo.get(topic:topic );
    result.fold((failure) {
      emit(NewsFailuerState(errMessage: failure.errMessage));
    }, (newsList) {
      emit(NewsSucessState(newsList: newsList));
    },);


  }
  







  
}