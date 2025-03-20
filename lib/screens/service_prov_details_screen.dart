import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_services/components/service_prov_detailed.dart';
import 'package:home_services/models/service_prov_detailed.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/service_prov_detailed_page_store.dart';



class ServiceProviderDetailScreen extends StatefulWidget {
  final int providerId;

  ServiceProviderDetailScreen({required this.providerId});

  @override
  _ServiceProviderDetailScreenState createState() =>
      _ServiceProviderDetailScreenState();
}

class _ServiceProviderDetailScreenState
    extends State<ServiceProviderDetailScreen> {
  final ServiceProviderDetailedPageStore store = ServiceProviderDetailedPageStore();


  @override
  void initState() {
    super.initState();
    store.loadServiceProviderDetails(1);
  }



  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Service Provider Details",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Observer(
            builder: (_) => IconButton(
              icon: Icon(
                store.serviceProvider?.isLiked ?? false
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: store.serviceProvider?.isLiked ?? false ? Colors.red : Colors.grey,
              ),
              onPressed: store.toggleLike,
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (store.serviceProvider == null) {
            return Center(child: Text("Service provider not found."));
          }

          return ServiceProviderDetailsWidget(serviceProvider: store.serviceProvider!);
        },
      ),
    );
    }}