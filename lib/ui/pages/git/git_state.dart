import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_manga/core/database/table/_repository.dart';

@immutable
abstract class GitState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class GitInitialState extends GitState {}

@immutable
class GitLoadingState extends GitState {}

@immutable
class GitRepoSearchState extends GitState {}

@immutable
class GitLoadedState extends GitState {
  final List<Repository>? list;

  GitLoadedState({@required this.list});

  GitLoadedState copyWith({List<Repository>? list}) =>
      GitLoadedState(list: list ?? this.list);

  @override
  List<Object> get props => [list!];
}

@immutable
class GitErrorState extends GitState {}
