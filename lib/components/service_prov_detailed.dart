import 'package:flutter/material.dart';
import '../models/service_prov_detailed.dart';

class ServiceProviderDetailsWidget extends StatelessWidget {
  final ServiceProviderDetails serviceProvider;

  ServiceProviderDetailsWidget({required this.serviceProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopImage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNameAndBio(),
                  SizedBox(height: 16),
                  if (serviceProvider.discount != null) _buildDiscount(),
                  SizedBox(height: 16),
                  if (serviceProvider.subcategories?.isNotEmpty ?? false)
                    _buildInfoTile("Services", serviceProvider.subcategories!.join(', ')),
                  if (serviceProvider.locations?.isNotEmpty ?? false)
                    _buildInfoTile("Locations", serviceProvider.locations!.join(', ')),
                  SizedBox(height: 16),
                  if (serviceProvider.photos?.isNotEmpty ?? false)
                    _buildMediaSection("Photos", serviceProvider.photos!, isPhoto: true),
                  if (serviceProvider.videos?.isNotEmpty ?? false)
                    _buildMediaSection("Videos", serviceProvider.videos!, isPhoto: false),
                  SizedBox(height: 16),
                  _buildActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      child: Image.asset(
        serviceProvider.providerImage,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildNameAndBio() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceProvider.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                serviceProvider.bio ?? "No bio available",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        // Reviews
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text(
                  "${serviceProvider.reviews ?? 0}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              "Reviews",
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDiscount() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_offer, color: Colors.green, size: 20),
          SizedBox(width: 8),
          Text(
            serviceProvider.discount!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.green[800]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.category_outlined, color: Colors.blueAccent, size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "$title: $content",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaSection(String title, List<String> media, {bool isPhoto = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: media.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: isPhoto
                        ? Image.asset(
                            item,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: 80,
                            height: 80,
                            color: Colors.blueAccent,
                            child: Icon(Icons.video_library, size: 40, color: Colors.white),
                          ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.share),
          label: Text("Share"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
           
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.chat),
          label: Text("Chat"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
           
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            
          ),
        ),
      ],
    );
  }
}