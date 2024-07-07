import 'package:flutter/material.dart';
import 'package:test_tt/home/settings/settings_tab.dart';

import '../model/category.dart';
import '../my_theme.dart';
import 'category/category_details.dart';
import 'category/category_fragment.dart';
import 'drawer/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            selectedMenuItem == HomeDrawer.settings ?
            //    'Settings'
       AppLocalizations.of(context)!.settings:
                selectedCategory == null ?
                           //  'News App'
                AppLocalizations.of(context)!.news_app:
            selectedCategory!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        drawer: Drawer(
          child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
        ),
        body: selectedMenuItem == HomeDrawer.settings ?
        SettingsTab
              ():
        selectedCategory == null
            ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
            : CategoryDetails(category: selectedCategory!),
      )
    ]);
  }

  CategoryDM? selectedCategory;

  void onCategoryItemClick(CategoryDM newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  int selectedMenuItem = HomeDrawer.categories ;
  void onSideMenuItemClick(int newSelectedMenuItem){
    selectedMenuItem = newSelectedMenuItem ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
