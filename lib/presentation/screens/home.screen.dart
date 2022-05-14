import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/domain/cubits/theme/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeCubit _themeCubit =
        BlocProvider.of<ThemeCubit>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            if (state is ThemeIsDark) {
              return Text(state.message);
            }
            if (state is ThemeIsLight) {
              return Text(state.message);
            }
            return const Text("");
          },
        ),
      ),
      body: BlocListener<ThemeCubit, ThemeState>(
        listener: (context, state) {
          if (state is ThemeIsDark) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Theme is Dark"),
              ),
            );
          }
          if (state is ThemeIsLight) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Theme is Light"),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      _themeCubit.toggleTheme();
                      // context.read<ThemeCubit>().toggleTheme();
                    },
                    child: const Text("Toggle Dark Mode"),
                  );
                },
              ),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  if (state is ThemeIsDark) {
                    return Text(
                      'Dark Theme is Active',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  if (state is ThemeIsLight) {
                    return Text(
                      'Light Theme is Active',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  return const Text("");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
