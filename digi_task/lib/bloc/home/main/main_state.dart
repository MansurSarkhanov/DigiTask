import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainSuccess extends MainState {}

class MainError extends MainState {}
