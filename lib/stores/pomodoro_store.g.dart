// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PomodoroStore on _PomodoroStoreBase, Store {
  final _$timeWorkAtom = Atom(name: '_PomodoroStoreBase.timeWork');

  @override
  int get timeWork {
    _$timeWorkAtom.reportRead();
    return super.timeWork;
  }

  @override
  set timeWork(int value) {
    _$timeWorkAtom.reportWrite(value, super.timeWork, () {
      super.timeWork = value;
    });
  }

  final _$timeRestAtom = Atom(name: '_PomodoroStoreBase.timeRest');

  @override
  int get timeRest {
    _$timeRestAtom.reportRead();
    return super.timeRest;
  }

  @override
  set timeRest(int value) {
    _$timeRestAtom.reportWrite(value, super.timeRest, () {
      super.timeRest = value;
    });
  }

  final _$_PomodoroStoreBaseActionController =
      ActionController(name: '_PomodoroStoreBase');

  @override
  void incrementWorkTime() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.incrementWorkTime');
    try {
      return super.incrementWorkTime();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementWorkTime() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.decrementWorkTime');
    try {
      return super.decrementWorkTime();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementRestTime() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.incrementRestTime');
    try {
      return super.incrementRestTime();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementRestTime() {
    final _$actionInfo = _$_PomodoroStoreBaseActionController.startAction(
        name: '_PomodoroStoreBase.decrementRestTime');
    try {
      return super.decrementRestTime();
    } finally {
      _$_PomodoroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timeWork: ${timeWork},
timeRest: ${timeRest}
    ''';
  }
}
