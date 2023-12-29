import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/cubit/cubit.dart';
import '../../layouts/cubit/states.dart';
import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) => {},
        builder: (context, state) {
          var list = NewsCubit.get(context).scienceArticles;
          return buildNewsList(list);
        });
  }
}
