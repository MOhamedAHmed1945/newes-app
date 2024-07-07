import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/category.dart';
import '../../my_theme.dart';
import '../tab/tab_widget.dart';
import 'category_details_view_model.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category-details';
  CategoryDM category;

  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
            builder: (context, viewModel, child) {
              if(viewModel.errorMessage != null){
                return Column(
                            children: [
                              Text(viewModel.errorMessage!),
                              ElevatedButton(
                                  onPressed: () {
                                    viewModel.getSources(widget.category.id);
                                  },
                                  child: const Text('Try Again'))
                            ],
                          );
              }
          else if (viewModel.sourcesList == null) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );
          }else{
            return TabWidget(sourcesList: viewModel.sourcesList!);
          }
        })

    );
  }
}
