import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/cubit.dart';
import 'package:news_app/layouts/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var newsCubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: _searchController,
                    inputType: TextInputType.text,
                    label: "Search",
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "search must not be empty";
                      }

                      return null;
                    },
                    prefix: Icons.search,
                    onChanged: (String value) {
                      newsCubit.getSearchData(value);
                    }),
              ),
              Expanded(
                child: buildNewsList(
                  newsCubit.searchArticles,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
