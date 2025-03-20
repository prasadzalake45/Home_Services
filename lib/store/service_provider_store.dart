import 'package:mobx/mobx.dart';
import '../models/services_details.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

part 'service_provider_store.g.dart';

class ServiceProviderStore = _ServiceProviderStore with _$ServiceProviderStore;

abstract class _ServiceProviderStore with Store {
  // Observable list to hold all service providers
  @observable
  ObservableList<ServicesDetails> serviceProviders = ObservableList<ServicesDetails>();

  // Observable list to hold filtered service providers
  @observable
  ObservableList<ServicesDetails> filteredServiceProviders = ObservableList<ServicesDetails>();

  // Observable string to hold the search query
  @observable
  String searchQuery = '';

  // Action to load service providers into the store
  @action
  Future<void> loadServiceProviders() async {
    final String response = await rootBundle.rootBundle.loadString('assets/serviceProviderDetails.json');
    final List<dynamic> data = json.decode(response);
    serviceProviders = ObservableList.of(data.map((e) => ServicesDetails.fromJson(e)).toList());
    filteredServiceProviders = ObservableList.of(serviceProviders);
  }

  // Action to filter service providers based on the search query
  @action
  void filterSearch(String query) {
    searchQuery = query;
    filteredServiceProviders = ObservableList.of(
      serviceProviders.where((provider) => provider.providerName.toLowerCase().contains(query.toLowerCase())).toList(),
    );
  }

  // Action to sort service providers alphabetically
  @action
  void sortServiceProviders() {
    filteredServiceProviders.sort((a, b) => a.providerName.compareTo(b.providerName));
  }
}