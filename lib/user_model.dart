import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserModel {
  final String? id;
  final String FullName ;
  final String BloodGroup ;
  final String ContactNumber ;
  final String Age ;
  final String Email ;
  final String Password ;

  const UserModel({
    this.id,
    required this.FullName,
    required this.BloodGroup,
    required this.ContactNumber,
    required this.Age,
    required this.Email,
    required this.Password
  });

  toJson(){
    return {
      "Name": FullName,
      "Blood Group":BloodGroup,
      "Contact Number": ContactNumber,
      "Age":Age,
      "Email":Email,
      "Password":Password,
    };
  }
}