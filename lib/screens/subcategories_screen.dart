import 'package:flutter/material.dart';
import 'package:home_services/components/services_widget.dart';
import 'package:home_services/fragments/account_fragment.dart';
import 'package:home_services/screens/dashboard_screen.dart';
import 'package:home_services/utils/widgets.dart';
import '../models/services_model.dart';
import 'service_details_screen.dart'; // Import the new screen
import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/subcategories_store.dart';


class SubcategoriesScreen extends StatefulWidget {
  final ServicesModel service;

  SubcategoriesScreen({required this.service});

  @override
  _SubcategoriesScreenState createState() => _SubcategoriesScreenState();
}

class _SubcategoriesScreenState extends State<SubcategoriesScreen> {
    final SubcategoryStore subcategoryStore = SubcategoryStore();

  final FocusNode _focusNode=FocusNode();
  int _selectedIndex=1;

  @override
  void initState() {
    super.initState();
  subcategoryStore.loadSubcategories(widget.service.subcategories);

    Future.delayed(Duration(milliseconds: 300),(){
      _focusNode.requestFocus();

    });
  }

  // void filterSearch(String query) {
  //   setState(() {
  //     filteredSubcategories = widget.service.subcategories
  //         .where((subcategory) => subcategory.name.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

  // void sortCategory(){
  //   setState(() {
  //     filteredSubcategories.sort((a,b)=>a.name.compareTo(b.name));
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
        // _showComingSoonDialog();
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
            "Subcategories",
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
              onPressed: subcategoryStore.sortSubcategories,
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
              onChanged:subcategoryStore. filterSearch,
              decoration: InputDecoration(
                hintText: "Search Subcategories...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child:Observer(
              builder:(_)=>ServiceWidget(
              items:subcategoryStore. filteredSubcategories,
              getItemName: (item) => item.name,
              // getItemImage: (item) => '', // Placeholder image
              onItemTap: (item) => () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailsScreen(service: widget.service),
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