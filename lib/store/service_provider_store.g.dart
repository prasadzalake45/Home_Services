// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceProviderStore on _ServiceProviderStore, Store {
  late final _$serviceProvidersAtom =
      Atom(name: '_ServiceProviderStore.serviceProviders', context: context);

  @override
  ObservableList<ServicesDetails> get serviceProviders {
    _$serviceProvidersAtom.reportRead();
    return super.serviceProviders;
  }

  @override
  set serviceProviders(ObservableList<ServicesDetails> value) {
    _$serviceProvidersAtom.reportWrite(value, super.serviceProviders, () {
      super.serviceProviders = value;
    });
  }

  late final _$filteredServiceProvidersAtom = Atom(
      name: '_ServiceProviderStore.filteredServiceProviders', context: context);

  @override
  ObservableList<ServicesDetails> get filteredServiceProviders {
    _$filteredServiceProvidersAtom.reportRead();
    return super.filteredServiceProviders;
  }

  @override
  set filteredServiceProviders(ObservableList<ServicesDetails> value) {
    _$filteredServiceProvidersAtom
        .reportWrite(value, super.filteredServiceProviders, () {
      super.filteredServiceProviders = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_ServiceProviderStore.searchQuery', context: context);

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

  late final _$loadServiceProvidersAsyncAction = AsyncAction(
      '_ServiceProviderStore.loadServiceProviders',
      context: context);

  @override
  Future<void> loadServiceProviders() {
    return _$loadServiceProvidersAsyncAction
        .run(() => super.loadServiceProviders());
  }

  late final _$_ServiceProviderStoreActionController =
      ActionController(name: '_ServiceProviderStore', context: context);

  @override
  void filterSearch(String query) {
    final _$actionInfo = _$_ServiceProviderStoreActionController.startAction(
        name: '_ServiceProviderStore.filterSearch');
    try {
      return super.filterSearch(query);
    } finally {
      _$_ServiceProviderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortServiceProviders() {
    final _$actionInfo = _$_ServiceProviderStoreActionController.startAction(
        name: '_ServiceProviderStore.sortServiceProviders');
    try {
      return super.sortServiceProviders();
    } finally {
      _$_ServiceProviderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceProviders: ${serviceProviders},
filteredServiceProviders: ${filteredServiceProviders},
searchQuery: ${searchQuery}
    ''';
  }
}
