import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';

class CircularMenuView extends StatefulWidget {
  final ValueNotifier<ThemeMode> theme;

  const CircularMenuView({super.key, required this.theme});

  @override
  State<CircularMenuView> createState() => _CircularMenuViewState();
}

class _CircularMenuViewState extends State<CircularMenuView> {
  String _colorName = 'No';

  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('circular_menu'),
        centerTitle: true,
      ),
      body: CircularMenu(
        alignment: Alignment.bottomCenter,
        backgroundWidget: Center(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 28),
              children: <TextSpan>[
                TextSpan(
                  text: _colorName,
                  style: TextStyle(color: _color, fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' button is clicked.'),
              ],
            ),
          ),
        ),
        toggleButtonColor: Colors.pink,
        items: [
          CircularMenuItem(
              icon: Icons.home,
              color: Colors.green,
              onTap: () {
                setState(() {
                  _color = Colors.green;
                  _colorName = 'Green';
                });
              }),
          CircularMenuItem(
              icon: Icons.search,
              color: Colors.blue,
              onTap: () {
                setState(() {
                  _color = Colors.blue;
                  _colorName = 'Blue';
                });
              }),
          CircularMenuItem(
              icon: Icons.settings,
              color: Colors.orange,
              onTap: () {
                setState(() {
                  _color = Colors.orange;
                  _colorName = 'Orange';
                });
              }),
          CircularMenuItem(
              icon: Icons.chat,
              color: Colors.purple,
              onTap: () {
                setState(() {
                  _color = Colors.purple;
                  _colorName = 'Purple';
                });
              }),
          CircularMenuItem(
              icon: Icons.notifications,
              color: Colors.brown,
              onTap: () {
                setState(() {
                  _color = Colors.brown;
                  _colorName = 'Brown';
                });
              })
        ],
      ),
    );
  }
}
