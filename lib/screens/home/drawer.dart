import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:themechanger/screens/themes/theme_manager.dart';
import 'package:themechanger/screens/themes/themes.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'App Drawer',
                style: TextStyle( fontSize: 20 ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          DrawerThemeTile(),
        ],
      ),
    );
  }

}

class DrawerThemeTile extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Theme',
        style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold ),
      ),
      children: AppTheme.values.map((e) {
        final themeData = appThemeData[e];
        bool selected = Provider.of<ThemeManager>(context, listen: false).themeData == themeData;
        return ListTile(
          onTap: () {
            Provider.of<ThemeManager>(context, listen: false).setTheme(e);
          },
          trailing: selected
              ? Icon( Icons.check )
              : null,
          title: Text(
            '${enumName(e)}',
            style: selected
                ? TextStyle( fontWeight: FontWeight.bold )
                : TextStyle( fontWeight: FontWeight.normal ),
          ),
        );
      }).toList(),
    );
  }
}