abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsChangeBottomNavState extends NewsState {}

class NewsOnLoadingBusinessArticlesState extends NewsState {}
class NewsSuccessLoadedBusinessArticlesState extends NewsState {}

class NewsErrorWhileLoadingBusinessArticlesState extends NewsState {
  final String error;
  NewsErrorWhileLoadingBusinessArticlesState(this.error);
}

class NewsOnLoadingSportsArticlesState extends NewsState {}
class NewsSuccessLoadedSportsArticlesState extends NewsState {}

class NewsErrorWhileLoadingSportsArticlesState extends NewsState {
  final String error;
  NewsErrorWhileLoadingSportsArticlesState(this.error);
}

class NewsOnLoadingScienceArticlesState extends NewsState {}
class NewsSuccessLoadedScienceArticlesState extends NewsState {}

class NewsErrorWhileLoadingScienceArticlesState extends NewsState {
  final String error;
  NewsErrorWhileLoadingScienceArticlesState(this.error);
}