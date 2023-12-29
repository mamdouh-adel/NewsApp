import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/cubit.dart';
import 'package:news_app/layouts/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusinessData()
        ..getSportsData()
        ..getScienceData(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "News App",
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
            ),
            body: cubit.getCurrentScreen(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.setScreen(index);
              },
              items: buildNavItems,
            ),
          );
        },
      ),
    );
  }
}
