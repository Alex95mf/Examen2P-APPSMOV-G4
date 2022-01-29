import '/constants/colors.dart';
import '/ui/routes.dart';
import 'package:flutter/material.dart';

class ExampleApp extends StatefulWidget {
  const ExampleApp({Key? key}) : super(key: key);
  @override
  State<ExampleApp> createState() => _ExampleApp();
}

class _ExampleApp extends State<ExampleApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: AppColors.mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light),
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}