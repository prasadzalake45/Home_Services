import 'package:flutter/material.dart';
import 'package:home_services/components/services_widget.dart';
import '../models/services_model.dart';
import 'service_details_screen.dart'; // Import the new screen

class SubcategoriesScreen extends StatefulWidget {
  final ServicesModel service;

  SubcategoriesScreen({required this.service});

  @override
  _SubcategoriesScreenState createState() => _SubcategoriesScreenState();
}

class _SubcategoriesScreenState extends State<SubcategoriesScreen> {
  List<Subcategory> filteredSubcategories = [];
  final FocusNode _focusNode=FocusNode();

  @override
  void initState() {
    super.initState();
    filteredSubcategories = widget.service.subcategories;

    Future.delayed(Duration(milliseconds: 300),(){
      _focusNode.requestFocus();

    });
  }

  void filterSearch(String query) {
    setState(() {
      filteredSubcategories = widget.service.subcategories
          .where((subcategory) => subcategory.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void sortCategory(){
    setState(() {
      filteredSubcategories.sort((a,b)=>a.name.compareTo(b.name));
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
              onPressed: sortCategory,
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
                hintText: "Search Subcategories...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ServiceWidget(
              items: filteredSubcategories,
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
        ],
      ),
    );
  }
}