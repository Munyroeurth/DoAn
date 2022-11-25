import 'package:flutter/material.dart';

class LoginArray {
  late final String BackBa;
  late final String Image;
  late final String Title;
  late final String Content;
  LoginArray(
      {required this.BackBa,
      required this.Image,
      required this.Title,
      required this.Content});
}

List<LoginArray> LoginList = [
  LoginArray(
      BackBa: 'Skip',
      Image: 'Image/image1.png',
      Title: 'Keep healthy work-life balance',
      Content:
          'Lorem ipsum dolor sit amet, consectetur adi piscing elit.Cursus sit suspendisse aliquam eget lorem viverra tincidunt.'),
  LoginArray(
      BackBa: 'Skip',
      Image: 'Image/Image2.png',
      Title: 'Track your work &get result',
      Content:
          'Lorem ipsum dolor sit amet, consectetur adi piscing elit.Cursus sit suspendisse aliquam eget lorem viverra tincidunt.'),
  LoginArray(
      BackBa: 'Skip',
      Image: 'Image/Image3.png',
      Title: 'Stay organized with team',
      Content:
          'Lorem ipsum dolor sit amet, consectetur adi piscing elit.Cursus sit suspendisse aliquam eget lorem viverra tincidunt.')
];
