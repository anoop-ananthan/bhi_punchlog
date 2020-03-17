// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$usersAtom = Atom(name: '_AppStore.users');

  @override
  List<User> get users {
    _$usersAtom.context.enforceReadPolicy(_$usersAtom);
    _$usersAtom.reportObserved();
    return super.users;
  }

  @override
  set users(List<User> value) {
    _$usersAtom.context.conditionallyRunInAction(() {
      super.users = value;
      _$usersAtom.reportChanged();
    }, _$usersAtom, name: '${_$usersAtom.name}_set');
  }

  final _$currentUserAtom = Atom(name: '_AppStore.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$profileUserAtom = Atom(name: '_AppStore.profileUser');

  @override
  User get profileUser {
    _$profileUserAtom.context.enforceReadPolicy(_$profileUserAtom);
    _$profileUserAtom.reportObserved();
    return super.profileUser;
  }

  @override
  set profileUser(User value) {
    _$profileUserAtom.context.conditionallyRunInAction(() {
      super.profileUser = value;
      _$profileUserAtom.reportChanged();
    }, _$profileUserAtom, name: '${_$profileUserAtom.name}_set');
  }

  final _$selectedTabIndexAtom = Atom(name: '_AppStore.selectedTabIndex');

  @override
  int get selectedTabIndex {
    _$selectedTabIndexAtom.context.enforceReadPolicy(_$selectedTabIndexAtom);
    _$selectedTabIndexAtom.reportObserved();
    return super.selectedTabIndex;
  }

  @override
  set selectedTabIndex(int value) {
    _$selectedTabIndexAtom.context.conditionallyRunInAction(() {
      super.selectedTabIndex = value;
      _$selectedTabIndexAtom.reportChanged();
    }, _$selectedTabIndexAtom, name: '${_$selectedTabIndexAtom.name}_set');
  }

  final _$selectedDateAtom = Atom(name: '_AppStore.selectedDate');

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.context.enforceReadPolicy(_$selectedDateAtom);
    _$selectedDateAtom.reportObserved();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.context.conditionallyRunInAction(() {
      super.selectedDate = value;
      _$selectedDateAtom.reportChanged();
    }, _$selectedDateAtom, name: '${_$selectedDateAtom.name}_set');
  }

  final _$getUsersAsyncAction = AsyncAction('getUsers');

  @override
  Future getUsers({dynamic date}) {
    return _$getUsersAsyncAction.run(() => super.getUsers(date: date));
  }
}
