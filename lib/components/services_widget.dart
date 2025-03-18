import 'package:flutter/material.dart';

class ServiceWidget extends StatefulWidget {
  final List<dynamic> items;
  final String Function(dynamic) getItemName;
  final String Function(dynamic)? getItemImage;
  final VoidCallback Function(dynamic) onItemTap;

  ServiceWidget({
    required this.items,
    required this.getItemName,
    this.getItemImage,
    required this.onItemTap,
  });

  @override
  _ServiceWidgetState createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return GestureDetector(
          onTap: widget.onItemTap(item),
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
                    // Left Side - Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: widget.getItemImage != null
                          ? Image.asset(
                              widget.getItemImage!(item),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.category,
                              size: 80,
                              color: Colors.grey,
                            ),
                    ),
                    SizedBox(width: 16), // Space between image and text

                    // Right Side - Text Details
                    Expanded(
                      child: Text(
                        widget.getItemName(item),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}