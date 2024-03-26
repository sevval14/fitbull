import 'package:flutter/material.dart';

String handleResponseRegister(int statusCode) {
    switch (statusCode) {
      case 400:
        return "The email address is already in use.";
      case 401:
        return "Wrong information";
      case 403:
        return "Forbidden. Access is denied.";
      case 404:
        return "Not found. The resource doesn't exist.";
      case 500:
        return "Internal Server Error. Please try again later.";
      default:
        return "Registration failed with status code: $statusCode. Please try again.";
    }

}

String handleResponseLogin(int statusCode) {
  switch (statusCode) {
    case 400:
      return "Email system is not registered. Please sign up";
    case 401:
      return "Please check your information";
    case 403:
      return "Forbidden. Access is denied.";
    case 404:
      return "Not found. The resource doesn't exist.";
    case 500:
      return "Internal Server Error. Please try again later.";
    default:
      return "Connection failed: $statusCode. Please try again.";
  }

}
