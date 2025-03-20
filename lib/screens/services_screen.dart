import 'package:flutter/material.dart';
import 'package:home_services/components/services_widget.dart';
import 'package:home_services/fragments/account_fragment.dart';
import 'package:home_services/screens/dashboard_screen.dart';
import 'package:home_services/utils/widgets.dart';
import '../models/services_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/service_store.dart';

import 'subcategories_screen.dart'; // Import the new screen
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final ServiceStore serviceStore=ServiceStore();
   final FocusNode _focusNode=FocusNode();
   int _selectedIndex=1;

  // @override
  void initState() {
    super.initState();
    serviceStore.loadServices();
      Future.delayed(Duration(milliseconds: 300),(){
      _focusNode.requestFocus();

    });
  }

  // Future<void> loadServices() async {
  //   final String response = await rootBundle.rootBundle.loadString('assets/services_list.json');
  //   final List<dynamic> data = json.decode(response);
  //   setState(() {
  //     services = data.map((e) => ServicesModel.fromJson(e)).toList();
  //     filteredServices = services;
  //   });
  //   print('Services loaded: ${services.length}');
  // }

  // void filterSearch(String query) {
  //   setState(() {
  //     filteredServices = services
  //         .where((service) => service.serviceName.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  //   print('Filtered services: ${filteredServices.length}');
  // }

  // void sortServices(){
  //   setState(() {
  //     filteredServices.sort((a,b)=>a.serviceName.compareTo(b.serviceName));
  //   });
  // }

   void dispose(){
    _focusNode.dispose();
    super.dispose()
;  }

 void _onItemTapped(int index) {
    switch (index) {
      case 0: // Home → Redirect to Dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
        break;
      case 1: // Bookings → Show Alert
      case 2: // Chats → Show Alert
        
        break;
      case 3: // Profile → Open Account Fragment
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountFragment()),
        );
        break;
    }
  }

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
              onPressed: serviceStore.sortServices,
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
              onChanged: serviceStore.filterSearch,
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
            child:Observer(builder: (_)=>ServiceWidget(
              items:serviceStore. filteredServices,
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
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
    );
  }
}