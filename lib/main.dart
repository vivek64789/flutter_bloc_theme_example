import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/custom_bloc_providers.dart';
import 'package:learning_bloc/domain/cubits/theme/theme_cubit.dart';
import 'package:learning_bloc/presentation/screens/home.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBlocProviders();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeCubit _themeCubit =
        BlocProvider.of<ThemeCubit>(context, listen: true);
    bool _isDark = _themeCubit.isDark;
    print(_isDark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _isDark ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(),
    );
  }
}
