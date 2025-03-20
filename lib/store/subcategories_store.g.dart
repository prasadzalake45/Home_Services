// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SubcategoryStore on _SubcategoryStore, Store {
  late final _$subcategoriesAtom =
      Atom(name: '_SubcategoryStore.subcategories', context: context);

  @override
  ObservableList<Subcategory> get subcategories {
    _$subcategoriesAtom.reportRead();
    return super.subcategories;
  }

  @override
  set subcategories(ObservableList<Subcategory> value) {
    _$subcategoriesAtom.reportWrite(value, super.subcategories, () {
      super.subcategories = value;
    });
  }

  late final _$filteredSubcategoriesAtom =
      Atom(name: '_SubcategoryStore.filteredSubcategories', context: context);

  @override
  ObservableList<Subcategory> get filteredSubcategories {
    _$filteredSubcategoriesAtom.reportRead();
    return super.filteredSubcategories;
  }

  @override
  set filteredSubcategories(ObservableList<Subcategory> value) {
    _$filteredSubcategoriesAtom.reportWrite(value, super.filteredSubcategories,
        () {
      super.filteredSubcategories = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_SubcategoryStore.searchQuery', context: context);

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

  late final _$_SubcategoryStoreActionController =
      ActionController(name: '_SubcategoryStore', context: context);

  @override
  void loadSubcategories(List<Subcategory> initialSubcategories) {
    final _$actionInfo = _$_SubcategoryStoreActionController.startAction(
        name: '_SubcategoryStore.loadSubcategories');
    try {
      return super.loadSubcategories(initialSubcategories);
    } finally {
      _$_SubcategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterSearch(String query) {
    final _$actionInfo = _$_SubcategoryStoreActionController.startAction(
        name: '_SubcategoryStore.filterSearch');
    try {
      return super.filterSearch(query);
    } finally {
      _$_SubcategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortSubcategories() {
    final _$actionInfo = _$_SubcategoryStoreActionController.startAction(
        name: '_SubcategoryStore.sortSubcategories');
    try {
      return super.sortSubcategories();
    } finally {
      _$_SubcategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subcategories: ${subcategories},
filteredSubcategories: ${filteredSubcategories},
searchQuery: ${searchQuery}
    ''';
  }
}
