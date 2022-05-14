import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/main.dart';

import 'domain/cubits/theme/theme_cubit.dart';

class CustomBlocProviders extends StatelessWidget {
  const CustomBlocProviders({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context)=> ThemeCubit()),
      ],
      child: MyHomePage(),
    );
  }
}