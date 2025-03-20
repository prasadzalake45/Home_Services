import 'package:mobx/mobx.dart';
import '../models/services_model.dart';

part 'subcategories_store.g.dart';

class SubcategoryStore = _SubcategoryStore with _$SubcategoryStore;

abstract class _SubcategoryStore with Store {
  // Observable list to hold all subcategories
  @observable
  ObservableList<Subcategory> subcategories = ObservableList<Subcategory>();

  // Observable list to hold filtered subcategories
  @observable
  ObservableList<Subcategory> filteredSubcategories = ObservableList<Subcategory>();

  // Observable string to hold the search query
  @observable
  String searchQuery = '';

  // Action to load subcategories into the store
  @action
  void loadSubcategories(List<Subcategory> initialSubcategories) {
    subcategories = ObservableList.of(initialSubcategories);
    filteredSubcategories = ObservableList.of(subcategories);
  }

  // Action to filter subcategories based on the search query
  @action
  void filterSearch(String query) {
    searchQuery = query;
    filteredSubcategories = ObservableList.of(
      subcategories.where((subcategory) => subcategory.name.toLowerCase().contains(query.toLowerCase())).toList(),
    );
  }

  // Action to sort subcategories alphabetically
  @action
  void sortSubcategories() {
    filteredSubcategories.sort((a, b) => a.name.compareTo(b.name));
  }
}