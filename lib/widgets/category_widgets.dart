import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_styles.dart';

class AddCategoryPhotoWidget extends StatelessWidget {
  // Parameters: height (photo: 180, map: 250), icon (Icon.photo or Icon.map_outlined)
  // Helper text: "Add category photo." or "Add category map."
  final IconData? icon;
  final double? height;
  final String helperText;
  const AddCategoryPhotoWidget({Key? key, required this.icon, required this.height, required this.helperText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: EdgeInsets.symmetric(vertical: 20),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        /// Add category main photo
        children: [
          Icon(
            icon,
            color: Styles.greyTextColor,
            size: 60,
          ),
          SizedBox(
            height: 12,
          ),
          Text(helperText),
        ],
      ),
    );
  }
}

class CategoryPhotoLoaded extends StatelessWidget {
  // add height as parameter also
  final double? height;
  final XFile? categoryPhotoFile;
  const CategoryPhotoLoaded({Key? key, required this.categoryPhotoFile, required this.height}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(File(categoryPhotoFile!.path)))  ,
          //image: Image.file(File(categoryPhotoFile!.path), fit: BoxFit.cover,)
        ),
        );
  }
}

