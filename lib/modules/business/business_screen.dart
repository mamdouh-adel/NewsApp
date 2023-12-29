import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/cubit.dart';
import 'package:news_app/layouts/cubit/states.dart';

import '../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) => {},
        builder: (context, state) {
          var list = NewsCubit.get(context).businessArticles;
          return buildNewsList(list);
        });
  }
}
