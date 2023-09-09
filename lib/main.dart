import 'package:flutter/material.dart';
import 'package:todoapp/routes/HomePage.dart';
import 'package:todoapp/routes/NewNotePage.dart';

void main(){
  runApp(
      MyApp()
  );
}
class MyApp extends StatelessWidget{
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.amber),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.amber)
        ),
        initialRoute: "/",
        routes: {
          "/":(context)=>HomePage(),
          "/new":(context)=>NewNotePage()
        },
      ),
    );

  }
}