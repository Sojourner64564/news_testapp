import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_testapp/core/injectable/injectable.dart';
import 'package:news_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:news_testapp/core/route/route.gr.dart';
import 'package:news_testapp/feature/news_feature/presentation/cubit/fetch_featured_news_cubit/fetch_featured_news_cubit.dart';
import 'package:news_testapp/feature/news_feature/presentation/cubit/fetch_latest_news_cubit/fetch_latest_news_cubit.dart';
import 'package:news_testapp/feature/news_feature/presentation/news_details_screen/news_details_screen.dart';
import 'package:news_testapp/feature/news_feature/presentation/news_screen/widget/list_view_tile_widget.dart';
import 'package:news_testapp/feature/news_feature/presentation/news_screen/widget/page_view_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final featuredNewsCubit = getIt<FetchFeaturedNewsCubit>();
  final latestNewsCubit = getIt<FetchLatestNewsCubit>();

  @override
  void initState() {
    featuredNewsCubit.fetchFeaturedNews();
    latestNewsCubit.fetchLatestNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Featured',
              style: MyTextStyles.title2,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: BlocBuilder<FetchFeaturedNewsCubit, FetchFeaturedNewsState>(
              bloc: featuredNewsCubit,
              builder: (context, state) {
                if (state is FetchFeaturedNewsStateInitial) {
                  return const Center(
                      child: Text(
                    'Initial',
                    style: MyTextStyles.greyText1,
                  ));
                }
                if (state is FetchFeaturedNewsStateLoading) {
                  return const Center(
                      child: Text(
                    'Loading',
                    style: MyTextStyles.greyText1,
                  ));
                }
                if (state is FetchFeaturedNewsStateLoaded) {
                  return PageView.builder(
                    itemCount: state.listArticle.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                            onTap: () {
                              AutoRouter.of(context).push(NewsDetailsRoute(id: state.listArticle[index].id));
                             /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDetailsScreen(
                                          id: state.listArticle[index].id,
                                        ),
                                ),
                              );*/
                            },
                            child: PageViewTileWidget(
                              articleEntity: state.listArticle[index],
                            )),
                      );
                    },
                  );
                }
                if (state is FetchFeaturedNewsStateEmpty) {
                  return const Center(
                      child: Text(
                    'Empty',
                    style: MyTextStyles.greyText1,
                  ));
                }
                if (state is FetchFeaturedNewsStateError) {
                  return Center(
                      child: Text(
                    state.errorText,
                    style: MyTextStyles.greyText1,
                  ));
                } else {
                  return const Center(
                      child: Text(
                    'Unexpected Error',
                    style: MyTextStyles.greyText1,
                  ));
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Latest News',
              style: MyTextStyles.title2,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<FetchLatestNewsCubit, FetchLatestNewsState>(
              bloc: latestNewsCubit,
              builder: (BuildContext context, state) {
                if (state is FetchLatestNewsStateInitial) {
                  return const Center(
                      child: Text(
                    'Initial',
                    style: MyTextStyles.greyText1,
                  ));
                }
                if (state is FetchLatestNewsStateLoading) {
                  return const Center(
                      child: Text(
                    'Loading',
                    style: MyTextStyles.greyText1,
                  ));
                }
                if (state is FetchLatestNewsStateError) {
                  return const Center(
                      child: Text(
                    'Error',
                    style: MyTextStyles.greyText1,
                  ));
                }
                if (state is FetchLatestNewsStateLoaded) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.listArticle.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          AutoRouter.of(context).push(NewsDetailsRoute(id: state.listArticle[index].id));
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsScreen(
                                id: state.listArticle[index].id,
                              ),
                            ),
                          );*/
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: ListViewTileWidget(
                            articleEntity: state.listArticle[index],
                            color: state.color,
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is FetchLatestNewsStateEmpty) {
                  return const Center(
                      child: Text(
                    'Empty',
                    style: MyTextStyles.greyText1,
                  ));
                } else {
                  return const Center(
                      child: Text(
                    'Unexpected Error',
                    style: MyTextStyles.greyText1,
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
