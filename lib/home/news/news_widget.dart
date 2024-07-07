import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../model/SourceResponse.dart';
import '../../my_theme.dart';
import 'news_item.dart';
import 'news_widget_view_model.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {

    super.initState();
    viewModel.getNewsBySourceId(widget.source.id??"");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child:
            Consumer<NewsWidgetViewModel>(
              child: const Text('Header Top'),
                builder: (context, viewModel, child) {
                  if(viewModel.errorMessage != null){
                    return Column(
                                children: [
                                  Text(viewModel.errorMessage!),
                                  ElevatedButton(
                                      onPressed: () {
                                       viewModel.getNewsBySourceId(
                                           widget.source.id??"");
                                      },
                                      child: const Text('Try Again'))
                                ],
                              );
                  }
         else  if (viewModel.newsList == null) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    child!,
                    NewsItem(news: viewModel.newsList![index]),
                  ],
                );
              },
              itemCount: viewModel.newsList!.length,
            );
          }
        })
        );
  }
}
