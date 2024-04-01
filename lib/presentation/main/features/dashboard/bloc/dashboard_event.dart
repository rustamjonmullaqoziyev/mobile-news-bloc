part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

class AddFavoriteEvent extends DashboardEvent {
  AddFavoriteEvent(this.article);

  final Article article;
}

class GetBreakingArticleEvent extends DashboardEvent {}

class GetTopArticleEvent extends DashboardEvent {}
