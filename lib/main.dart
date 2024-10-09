import 'package:flutter/material.dart';
import 'package:login_app/modal/user.dart';
import 'package:login_app/screen/dashboard.dart';
// import 'package:login_app/screen/login.dart';

void main() {
  runApp(MaterialApp(
    // home: LoginScreen(),
    home: Dashboard(user:  User(
      id: '1',
      login: 'john_doe',
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      activated: 'true',
      langKey: 'en',
      imageUrl: 'https://th.bing.com/th/id/OIP.AbGafkazjc_S1pZPh0B9cQHaIm?w=173&h=201&c=7&r=0&o=5&pid=1.7',
      // imageUrl: 'null',
      resetDate: '2023-01-01T00:00:00Z',
      mobileNumber: '1234567890',
      imeiNumber1: '123456789012345',
      imeiNumber2: '123456789012346',
      branch1: 'Kharagpur',
      branch2: 'Marketing',
      designation: 'Driver',
      reportingTo: 'Jane Smith',
      fcmToken: 'fcm_token_1',
      vehicleNumber: 'MH 08 WY 1001',
      entryDays: '120',
    ))
  ));
}
