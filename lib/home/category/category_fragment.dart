import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/category.dart';
import 'category_item.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryDM.getCategories();
  Function onCategoryItemClick ;
  CategoryFragment({super.key, required this.onCategoryItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.pick_your_category_nof_interest,

          style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                  onCategoryItemClick(categoriesList[index]);
                  },
                      child: CategoryItem(category: categoriesList[index], index: index));
                },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
