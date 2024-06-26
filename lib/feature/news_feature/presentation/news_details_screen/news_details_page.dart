import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_testapp/core/injectable/injectable.dart';
import 'package:news_testapp/core/my_colors/my_colors.dart';
import 'package:news_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:news_testapp/feature/news_feature/presentation/cubit/fetch_details_news_cubit/fetch_details_news_cubit.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({super.key, required this.id});
  final String id;

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  final fetchDetailsNewsCubit = getIt<FetchDetailsNewsCubit>();

  @override
  void initState() {
    fetchDetailsNewsCubit.fetchDetailsNews(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Container(
              height: 500,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: MyColors.transparentBlackColor,
                    blurRadius: 10,
                    offset: Offset(0, 5), // Shadow position
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    child: BlocBuilder<FetchDetailsNewsCubit,
                        FetchDetailsNewsState>(
                      bloc: fetchDetailsNewsCubit,
                      builder:
                          (BuildContext context, FetchDetailsNewsState state) {
                        if (state is FetchDetailsNewsStateInitial) {
                          return const Center(
                              child: Text(
                            'Initial',
                            style: MyTextStyles.greyText1,
                          ));
                        }
                        if (state is FetchDetailsNewsStateLoading) {
                          return const Center(
                              child: Text(
                            'Loading',
                            style: MyTextStyles.greyText1,
                          ));
                        }
                        if (state is FetchDetailsNewsStateLoaded) {
                          return Image.network(
                            state.articleEntity.imageUrl,
                            fit: BoxFit.cover,
                          );
                        }
                        if (state is FetchDetailsNewsStateError) {
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
                  Container(
                    decoration: const BoxDecoration(
                      color: MyColors.transparentBlackColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 15,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: MyColors.whiteColor,
                      ),
                      onPressed: () {
                        AutoRouter.of(context).popForced();
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 20,
                    child: BlocBuilder<FetchDetailsNewsCubit,
                        FetchDetailsNewsState>(
                      bloc: fetchDetailsNewsCubit,
                      builder: (context, state) {
                        if (state is FetchDetailsNewsStateInitial) {
                          return const Center(
                              child: Text(
                            'Initial',
                            style: MyTextStyles.greyText1,
                          ));
                        }
                        if (state is FetchDetailsNewsStateLoading) {
                          return const Center(
                              child: Text(
                            'Loading',
                            style: MyTextStyles.greyText1,
                          ));
                        }
                        if (state is FetchDetailsNewsStateLoaded) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                state.articleEntity.title,
                                style: MyTextStyles.whiteTitle3,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          );
                        }
                        if (state is FetchDetailsNewsStateError) {
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 0),
          BlocBuilder<FetchDetailsNewsCubit, FetchDetailsNewsState>(
            bloc: fetchDetailsNewsCubit,
            builder: (context, state) {
              if (state is FetchDetailsNewsStateInitial) {
                return const Center(
                    child: Text(
                  'Initial',
                  style: MyTextStyles.greyText1,
                ));
              }
              if (state is FetchDetailsNewsStateLoading) {
                return const Center(
                    child: Text(
                  'Loading',
                  style: MyTextStyles.greyText1,
                ));
              }
              if (state is FetchDetailsNewsStateLoaded) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                     state.articleEntity.description,
                        style: MyTextStyles.title1,
                    ),
                  ),
                );
              }
              if (state is FetchDetailsNewsStateError) {
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://media.gettyimages.com/id/1475080427/photo/work-bench-with-tools.jpg?s=612x612&w=gi&k=20&c=xV2SRZPwuRgukw63mLj4F235btlBZJO1onk7-okSf_U=',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
