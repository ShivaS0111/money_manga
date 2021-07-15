import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class GitEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class GitReloadEvent extends GitEvent {}

@immutable
class GitLoadedEvent extends GitEvent {}

@immutable
class CartShowPopupEvent extends GitEvent {}