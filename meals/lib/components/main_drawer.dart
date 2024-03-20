// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(
            title: 'Refeições',
            icon: Icons.restaurant,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          buildListTile(
            title: 'Filtros',
            icon: Icons.settings,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.FILTERS);
            },
          ),
        ],
      ),
    );
  }
}