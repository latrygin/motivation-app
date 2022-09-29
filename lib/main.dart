import 'package:flutter/material.dart';
import 'package:motivation/assets/themes/theme_dark.dart';
import 'package:motivation/assets/themes/theme_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivation',
      theme: darkTheme,
      home: const TestTheme(),
    );
  }
}

class TestTheme extends StatelessWidget {
  const TestTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'headline1',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'headline2',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'headline3',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'headline4',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'bodyText1',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'bodyText2',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Вход',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                style: Theme.of(context).elevatedButtonTheme.style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
