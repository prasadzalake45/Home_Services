import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_services/components/service_prov_detailed.dart';
import 'package:home_services/models/service_prov_detailed.dart';


class ServiceProviderDetailScreen extends StatefulWidget {
  final int providerId;

  ServiceProviderDetailScreen({required this.providerId});

  @override
  _ServiceProviderDetailScreenState createState() =>
      _ServiceProviderDetailScreenState();
}

class _ServiceProviderDetailScreenState
    extends State<ServiceProviderDetailScreen> {
  ServiceProviderDetails? serviceProvider;

  @override
  void initState() {
    super.initState();
    loadServiceProviderDetails();
  }

 Future<void> loadServiceProviderDetails() async {
  try {
    final String response =
        await rootBundle.loadString('assets/services_prov_detailed.json');
    final List<dynamic> data = json.decode(response);
    final provider =
        data.firstWhere((element) => element['id'] == 1); // Example: Fetch provider with id = 1
    setState(() {
      serviceProvider = ServiceProviderDetails.fromJson(provider);
    });
  } catch (e) {
    print("Error loading service provider details: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Provider Details"
        ,
        style:  TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        
        
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              serviceProvider?.isLiked ?? false
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: serviceProvider?.isLiked ?? false ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                serviceProvider?.isLiked = !(serviceProvider?.isLiked ?? false);
              });
            },
          ),
        ],
      ),
      body: serviceProvider == null
          ? Center(child: CircularProgressIndicator())
          : ServiceProviderDetailsWidget(serviceProvider: serviceProvider!),
    );
  }
}