import 'package:floating_action_pack/circular_menu/circular_menu_view.dart';
import 'package:floating_action_pack/flutter_floating_bottom_bar/flutter_floating_bottom_bar_view.dart';
import 'package:floating_action_pack/flutter_speed_dial/flutter_speed_dial_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var theme = ValueNotifier(ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: theme,
      builder: (context, value, child) => MaterialApp(
        title: "Floating Action Button Packages",
        home: MyHomePage(theme: theme),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[900],
        ),
        themeMode: value,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final ValueNotifier<ThemeMode> theme;

  const MyHomePage({super.key, required this.theme});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floating Packages"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CircularMenuView(   theme: widget.theme,),),);
                },
                child: Text("Circular Menu")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FlutterFloatingBottomBarView(
                        theme: widget.theme,
                      ),
                    ),
                  );
                },
                child: Text("Flutter Floating Bottom Bar")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FlutterSpeedDialView(
                        theme: widget.theme,
                      ),
                    ),
                  );
                },
                child: Text("Flutter Speed Dial"))
          ],
        ),
      ),
    );
  }
}
