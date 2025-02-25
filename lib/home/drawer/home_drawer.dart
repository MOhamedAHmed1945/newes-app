import 'package:flutter/material.dart';
import '../../my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1 ;
  static const int settings = 2 ;
  Function onSideMenuItemClick ;
  HomeDrawer({super.key, required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context)
          .size.height*0.1),
          color: MyTheme.primaryLightColor,
            child: Text(AppLocalizations.of(context)!.news_app,
            //  'News App!',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 10,),
                Text(
                  AppLocalizations.of(context)!.categories,
                   //'Categories',
                style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(HomeDrawer.settings);
            },
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 10,),
                Text(
              AppLocalizations.of(context)!.settings,
                style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
