import 'package:flutter/material.dart';
import 'package:restaurantApp/components/main_drawer.dart';
import 'package:restaurantApp/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
      String title, String subtitle, bool value, Function onChanged) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Gluten Free',
                    'Only shows gluten free meals',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value),
                  ),
                  _createSwitch(
                    'Lactose Free',
                    'Only shows lactose free meals',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value),
                  ),
                  _createSwitch(
                    'Vegan Free',
                    'Only shows vegan free meals',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value),
                  ),
                  _createSwitch(
                    'Vegetarian Free',
                    'Only shows vegetarian free meals',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
