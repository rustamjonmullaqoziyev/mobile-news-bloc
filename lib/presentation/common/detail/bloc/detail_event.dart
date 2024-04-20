part of 'detail_bloc.dart';

abstract class DetailEvent {}

class AddFavoriteEvent extends DetailEvent {
  AddFavoriteEvent(this.article);

  final Article article;
}