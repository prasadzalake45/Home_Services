// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_prov_detailed_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceProviderDetailedPageStore
    on _ServiceProviderDetailedPageStore, Store {
  late final _$serviceProviderAtom = Atom(
      name: '_ServiceProviderDetailedPageStore.serviceProvider',
      context: context);

  @override
  ServiceProviderDetails? get serviceProvider {
    _$serviceProviderAtom.reportRead();
    return super.serviceProvider;
  }

  @override
  set serviceProvider(ServiceProviderDetails? value) {
    _$serviceProviderAtom.reportWrite(value, super.serviceProvider, () {
      super.serviceProvider = value;
    });
  }

  late final _$isLoadingAtom = Atom(
      name: '_ServiceProviderDetailedPageStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadServiceProviderDetailsAsyncAction = AsyncAction(
      '_ServiceProviderDetailedPageStore.loadServiceProviderDetails',
      context: context);

  @override
  Future<void> loadServiceProviderDetails(int providerId) {
    return _$loadServiceProviderDetailsAsyncAction
        .run(() => super.loadServiceProviderDetails(providerId));
  }

  late final _$_ServiceProviderDetailedPageStoreActionController =
      ActionController(
          name: '_ServiceProviderDetailedPageStore', context: context);

  @override
  void toggleLike() {
    final _$actionInfo = _$_ServiceProviderDetailedPageStoreActionController
        .startAction(name: '_ServiceProviderDetailedPageStore.toggleLike');
    try {
      return super.toggleLike();
    } finally {
      _$_ServiceProviderDetailedPageStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceProvider: ${serviceProvider},
isLoading: ${isLoading}
    ''';
  }
}
