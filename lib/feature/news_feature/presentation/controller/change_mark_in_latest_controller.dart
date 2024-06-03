import 'package:injectable/injectable.dart';
import 'package:news_testapp/core/injectable/injectable.dart';
import 'package:news_testapp/core/my_colors/my_colors.dart';
import 'package:news_testapp/feature/news_feature/presentation/cubit/fetch_latest_news_cubit/fetch_latest_news_cubit.dart';

@lazySingleton
class ChangeMarkInLatestController{
  final latestNewsCubit = getIt<FetchLatestNewsCubit>();

  void markAllRead(){
    latestNewsCubit.color = MyColors.background2Color;
    latestNewsCubit.fetchLatestNews();
  }
}