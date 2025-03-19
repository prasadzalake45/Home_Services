import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:home_services/components/service_provider_widget.dart';
import 'package:home_services/screens/service_prov_details_screen.dart';
import '../models/services_details.dart';
import '../utils/widgets.dart'; // Custom bottom navigation bar
import '../fragments/account_fragment.dart';
import 'dashboard_screen.dart';
import '../models/services_list.dart';
import '../models/services_model.dart'; // Import the ServicesModel class

class ServiceDetailsScreen extends StatefulWidget {
  final ServicesModel service;

  ServiceDetailsScreen({required this.service});

  @override
  _ServiceDetailsScreenState createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  List<ServicesDetails> servicesDetails = [];
  List<ServicesDetails> filteredServices = [];
  final FocusNode _focusNode=FocusNode();
  int _selectedIndex = 1; // Default index for Services
  






  @override
  void initState() {
    super.initState();
    loadServices();
      Future.delayed(Duration(milliseconds: 300),(){
      _focusNode.requestFocus();

    });
  }

  Future<void> loadServices() async {
    final String response =
        await rootBundle.rootBundle.loadString('assets/serviceProviderDetails.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      servicesDetails = data.map((e) => ServicesDetails.fromJson(e)).toList();
      filteredServices = servicesDetails;
    });
  }

  void filterSearch(String query) {
    setState(() {
      filteredServices = servicesDetails
          .where((service) =>
              service.serviceName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }


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
        _showComingSoonDialog();
        break;
      case 3: // Profile → Open Account Fragment
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountFragment()),
        );
        break;
    }
  }

  void _showComingSoonDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Coming Soon"),
        content: Text("This feature will be available in future updates."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context)=>ServiceProviderDetailScreen(providerId: 0,),
          )
          );
      },
      child: Scaffold(
        body: Column(
          children: [
            // AppBar with search bar
            Container(
              color: Theme.of(context).appBarTheme.backgroundColor,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                      "Service Providers",
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                    ),
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.sort_by_alpha),
                        onPressed: () {
                          setState(() {
                            filteredServices.sort(
                                (a, b) => a.providerName.compareTo(b.providerName));
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextField(
                      onChanged: filterSearch,
                      focusNode: _focusNode,
                      
                      decoration: InputDecoration(
                      
                        hintText: "Search Service Provider ...",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            // Scrollable ListView
            Expanded(
              child: filteredServices.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: filteredServices.length,
                      itemBuilder: (context, index) {
                        final service = filteredServices[index];
                        return ServiceProviderCard(
                          imagePath: service.imagePath, 
                          providerName: service.providerName, 
                          serviceName: service.serviceName, 
                          rating: service.rating,
                        );
                          
                          
                      },
                    ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNav(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

class ServiceProviderDetailsScreen {
}
