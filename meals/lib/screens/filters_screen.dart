// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/filters.dart';

class FiltersScreen extends StatefulWidget {
  final Filter filters;
  final Function(Filter) onFiltersChanged;

  const FiltersScreen(this.onFiltersChanged, this.filters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Filter? filters;

  @override
  void initState() {
    super.initState();
    filters = widget.filters;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onFiltersChanged(filters!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Ajuste suas preferências',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glúten',
                  'Só exibe refeições sem glúten!',
                  filters!.isGlutenFree,
                  (value) {
                    setState(() {
                      filters!.isGlutenFree = value;
                    });
                  },
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose!',
                  filters!.isLactoseFree,
                  (value) {
                    setState(() {
                      filters!.isLactoseFree = value;
                    });
                  },
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas!',
                  filters!.isVegan,
                  (value) {
                    setState(() {
                      filters!.isVegan = value;
                    });
                  },
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas!',
                  filters!.isVegetarian,
                  (value) {
                    setState(() {
                      filters!.isVegetarian = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
