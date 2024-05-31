import 'package:digi_task/features/tasks/data/model/tasks_model.dart';
import 'package:equatable/equatable.dart';

abstract class TasksState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksSuccess extends TasksState {
  final List<TasksModel>? tasks;
  TasksSuccess({required this.tasks});
}

class TasksError extends TasksState {}
