// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceStore on _ServiceStore, Store {
  late final _$servicesAtom =
      Atom(name: '_ServiceStore.services', context: context);

  @override
  ObservableList<ServicesModel> get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(ObservableList<ServicesModel> value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  late final _$filteredServicesAtom =
      Atom(name: '_ServiceStore.filteredServices', context: context);

  @override
  ObservableList<ServicesModel> get filteredServices {
    _$filteredServicesAtom.reportRead();
    return super.filteredServices;
  }

  @override
  set filteredServices(ObservableList<ServicesModel> value) {
    _$filteredServicesAtom.reportWrite(value, super.filteredServices, () {
      super.filteredServices = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_ServiceStore.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$loadServicesAsyncAction =
      AsyncAction('_ServiceStore.loadServices', context: context);

  @override
  Future<void> loadServices() {
    return _$loadServicesAsyncAction.run(() => super.loadServices());
  }

  late final _$_ServiceStoreActionController =
      ActionController(name: '_ServiceStore', context: context);

  @override
  void filterSearch(String query) {
    final _$actionInfo = _$_ServiceStoreActionController.startAction(
        name: '_ServiceStore.filterSearch');
    try {
      return super.filterSearch(query);
    } finally {
      _$_ServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortServices() {
    final _$actionInfo = _$_ServiceStoreActionController.startAction(
        name: '_ServiceStore.sortServices');
    try {
      return super.sortServices();
    } finally {
      _$_ServiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
services: ${services},
filteredServices: ${filteredServices},
searchQuery: ${searchQuery}
    ''';
  }
}
