// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/filters.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';
import 'models/meal.dart';
import 'screens/categories_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Filter filters = Filter();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Filter filters) {
    setState(() {
      this.filters = filters;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = filters.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = filters.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = filters.isVegan && !meal.isVegan;
        final filterVegetarian = filters.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
     setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.pink,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white)
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: const Color.fromARGB(255, 179, 171, 171),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.FILTERS: (ctx) => FiltersScreen(_filterMeals, filters),
      },
    );
  }
}
