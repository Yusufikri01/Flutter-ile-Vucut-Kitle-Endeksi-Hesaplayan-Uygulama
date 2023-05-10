import 'package:body_mass_index/Pages/HomePage.dart';
import 'package:body_mass_index/ProviderSetting/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: prefs,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())));
        }

        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ThemeProvider(
                darkThemeOn: snapshot.data!.getBool("darkTheme") ?? false,
              ),
            ),
          ],
          child: Builder(builder: (BuildContext context) {
            var themechange = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themechange.getTheme(),
              home: const HomePage(),
            );
          }),
        );
      },
    );
  }
}
