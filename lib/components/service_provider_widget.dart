import 'package:flutter/material.dart';

class ServiceProviderCard extends StatefulWidget {
  final String imagePath;
  final String providerName;
  final String serviceName;
  final String rating;
  

  ServiceProviderCard({
    required this.imagePath,
    required this.providerName,
    required this.serviceName,
    required this.rating,

  });

  @override
  _ServiceProviderCardState createState() => _ServiceProviderCardState();
}

class _ServiceProviderCardState extends State<ServiceProviderCard>{


  bool isFavourite=false;

  void toggleFavourite(){
    setState(() {
      isFavourite=!isFavourite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 200,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Side - Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.imagePath,
                  width: 90,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),

              // Right Side - Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.providerName,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.serviceName,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text(
                          widget.rating.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Right Bottom Section
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.chat),
                        onPressed: (){

                        },
                      ),
                      IconButton(
                        icon: Icon(
                          isFavourite?Icons.favorite:Icons.favorite_border,
                          color: isFavourite?Colors.red:Colors.grey,
                          
                          
                          ),
                        
                        onPressed: toggleFavourite,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
    );
    
  }
}
