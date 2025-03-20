import 'package:mobx/mobx.dart';
import '../models/service_prov_detailed.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

part 'service_prov_detailed_page_store.g.dart';

class ServiceProviderDetailedPageStore = _ServiceProviderDetailedPageStore with _$ServiceProviderDetailedPageStore;

abstract class _ServiceProviderDetailedPageStore with Store {
  // Observable to hold the service provider details
  @observable
  ServiceProviderDetails? serviceProvider;

  // Observable to track loading state
  @observable
  bool isLoading = true;

  // Action to load service provider details
  @action
  Future<void> loadServiceProviderDetails(int providerId) async {
    try {
      isLoading = true;
      final String response = await rootBundle.rootBundle.loadString('assets/services_prov_detailed.json');
      final List<dynamic> data = json.decode(response);
      final provider = data.firstWhere((element) => element['id'] == providerId, orElse: () => null);

      if (provider != null) {
        serviceProvider = ServiceProviderDetails.fromJson(provider);
      }
    } catch (e) {
      print("Error loading service provider details: $e");
    } finally {
      isLoading = false;
    }
  }

  // Action to toggle the "like" state of the service provider
  @action
  void toggleLike() {
    if (serviceProvider != null) {
      serviceProvider!.isLiked = !(serviceProvider!.isLiked ?? false);
    }
  }
}