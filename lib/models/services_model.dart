import 'package:flutter/material.dart';
import 'package:home_services/utils/images.dart';

class ServicesModel {
  String serviceName;
  String serviceImage;
  List<Subcategory> subcategories;
  bool isSelected;

  ServicesModel({
    required this.serviceName,
    required this.serviceImage,
    required this.subcategories,
    this.isSelected = false,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    var list = json['subcategories'] as List;
    List<Subcategory> subcategoryList = list.map((i) => Subcategory.fromJson(i)).toList();

    return ServicesModel(
      serviceName: json['serviceName'],
      serviceImage: json['imagePath'],
      subcategories: subcategoryList,
      isSelected: json['isSelected'] ?? false,
    );
  }
}

class Subcategory {
  String name;

  Subcategory(this.name);

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

