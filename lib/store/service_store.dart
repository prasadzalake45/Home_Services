import 'package:mobx/mobx.dart';
import '../models/services_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

part 'service_store.g.dart';

class ServiceStore = _ServiceStore with _$ServiceStore;

abstract class _ServiceStore with Store {
  @observable
  ObservableList<ServicesModel> services = ObservableList<ServicesModel>();

  @observable
  ObservableList<ServicesModel> filteredServices = ObservableList<ServicesModel>();

  @observable
  String searchQuery = '';

  @action
  Future<void> loadServices() async {
    final String response = await rootBundle.rootBundle.loadString('assets/services_list.json');
    final List<dynamic> data = json.decode(response);
    services = ObservableList.of(data.map((e) => ServicesModel.fromJson(e)).toList());
    filteredServices = ObservableList.of(services);
  }

  @action
  void filterSearch(String query) {
    searchQuery = query;
    filteredServices = ObservableList.of(
      services.where((service) => service.serviceName.toLowerCase().contains(query.toLowerCase())).toList(),
    );
  }

  @action
  void sortServices() {
    filteredServices.sort((a, b) => a.serviceName.compareTo(b.serviceName));
  }
}