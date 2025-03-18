import 'package:flutter/material.dart';
import 'package:home_services/components/services_widget.dart';
import '../models/services_model.dart';
import 'subcategories_screen.dart'; // Import the new screen
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<ServicesModel> services = [];
  List<ServicesModel> filteredServices = [];
   final FocusNode _focusNode=FocusNode();

  @override
  void initState() {
    super.initState();
    loadServices();
      Future.delayed(Duration(milliseconds: 300),(){
      _focusNode.requestFocus();

    });
  }

  Future<void> loadServices() async {
    final String response = await rootBundle.rootBundle.loadString('assets/services_list.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      services = data.map((e) => ServicesModel.fromJson(e)).toList();
      filteredServices = services;
    });
    print('Services loaded: ${services.length}');
  }

  void filterSearch(String query) {
    setState(() {
      filteredServices = services
          .where((service) => service.serviceName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
    print('Filtered services: ${filteredServices.length}');
  }

  void sortServices(){
    setState(() {
      filteredServices.sort((a,b)=>a.serviceName.compareTo(b.serviceName));
    });
  }

   void dispose(){
    _focusNode.dispose();
    super.dispose()
;  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text(
            "Services",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          actions: [
            IconButton(
              onPressed: sortServices,
              icon: Icon(Icons.sort_by_alpha),
            )
          ],
        ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              focusNode: _focusNode,
              onChanged: filterSearch,
              decoration: InputDecoration(
                hintText: "Search Services...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ServiceWidget(
              items: filteredServices,
              getItemName: (item) => item.serviceName,
              getItemImage: (item) => item.serviceImage,
              onItemTap: (item) => () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubcategoriesScreen(service: item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}