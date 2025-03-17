import 'package:flutter/material.dart';
import '../models/services_model.dart';
import 'service_details_screen.dart'; // Import the new screen

class SubcategoriesScreen extends StatelessWidget {
  final ServicesModel service;

  SubcategoriesScreen({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.serviceName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Subcategories",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: service.subcategories.length,
              itemBuilder: (context, index) {
                final subcategory = service.subcategories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceDetailsScreen(service: service),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left Side - Icon (Placeholder for Image)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: Colors.grey[300],
                                width: 80,
                                height: 80,
                                child: Icon(
                                  Icons.category,
                                  size: 40,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            SizedBox(width: 16), // Space between icon and text

                            // Right Side - Text Details
                            Expanded(
                              child: Text(
                                subcategory.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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