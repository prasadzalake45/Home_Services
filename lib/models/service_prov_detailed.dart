class ServiceProviderDetails {
  final int id;
  final String name;
  final String providerImage;
  final String? email; // Nullable
  final int? reviews; // Nullable
  final String? discount; // Nullable
  final String? bio; // Nullable
  final List<String>? subcategories; // Nullable
  final List<String>? locations; // Nullable
  final List<String>? photos; // Nullable
  final List<String>? videos; // Nullable
  bool isLiked;

  ServiceProviderDetails({
    required this.id,
    required this.name,
    required this.providerImage,
    this.email,
    this.reviews,
    this.discount,
    this.bio,
    this.subcategories,
    this.locations,
    this.photos,
    this.videos,
    this.isLiked = false,
  });

  factory ServiceProviderDetails.fromJson(Map<String, dynamic> json) {
    return ServiceProviderDetails(
      id: json['id'],
      name: json['name'],
      providerImage: json['providerImage'],
      email: json['email'], // Nullable
      reviews: json['reviews'], // Nullable
      discount: json['discount'], // Nullable
      bio: json['bio'], // Nullable
      subcategories: json['subcategories'] != null
          ? List<String>.from(json['subcategories'])
          : null, // Handle null
      locations: json['locations'] != null
          ? List<String>.from(json['locations'])
          : null, // Handle null
      photos: json['photos'] != null
          ? List<String>.from(json['photos'])
          : null, // Handle null
      videos: json['videos'] != null
          ? List<String>.from(json['videos'])
          : null, // Handle null
      isLiked: json['isLiked'] ?? false, // Default to false if null
    );
  }
}