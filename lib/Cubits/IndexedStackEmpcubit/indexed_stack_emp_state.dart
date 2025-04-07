part of 'indexed_stack_emp_cubit.dart';

@immutable
sealed class IndexedStackEmpState {}

final class IndexedStackEmpInitial extends IndexedStackEmpState {}
final class ChangedIndex extends IndexedStackEmpState {}
