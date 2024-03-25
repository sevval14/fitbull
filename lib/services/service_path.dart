import 'package:flutter/material.dart';

enum ServicePath{
  LOGIN,
  REGISTER,
  GYM,
}
extension ServicePathExtenion on ServicePath {
  static const String _baseUrl = "http://192.168.73.68:8080";

  String get path {
    switch (this) {
      case ServicePath.LOGIN:
        return "$_baseUrl/auth/login";
      case ServicePath.REGISTER:
        return "$_baseUrl/auth/register";
      case ServicePath.GYM:
        return "$_baseUrl/gym";
    }
  }
}