import 'package:flutter/material.dart';

enum ServicePath{
  CUSTOMER_LOGIN,
  CUSTOMER_REGISTER,
  GYM_OWNER_LOGIN,
  GYM_OWNER_REGISTER,
  GYM,
  ACTIVITES,
  EDUCATOR,
}
extension ServicePathExtenion on ServicePath {
  static const String _baseUrl = "http://10.39.8.150:8080";

  String get path {
    switch (this) {
      case ServicePath.CUSTOMER_LOGIN:
        return "$_baseUrl/auth/login";
      case ServicePath.CUSTOMER_REGISTER:
        return "$_baseUrl/auth/register";
      case ServicePath.GYM_OWNER_LOGIN:
        return "$_baseUrl/auth/login/gym_owner";
      case ServicePath.GYM_OWNER_REGISTER:
        return "$_baseUrl/auth/register/gym_owner";
      case ServicePath.GYM:
        return "$_baseUrl/gym";
      case ServicePath.ACTIVITES:
        return "$_baseUrl/activities";
      case ServicePath.EDUCATOR:
        return "$_baseUrl/educators";
    }
  }
}