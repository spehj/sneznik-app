import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/category_model.dart';
import '../../utils/app_styles.dart';
import '../../widgets/next_widget.dart';

class AddCategoryScreen extends StatefulWidget {
  final Category? category;

  const AddCategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final ctrlCatName = TextEditingController();
  final ctrlCatDescription = TextEditingController();
  String _categoryImageUrl = "";
  String _categoryMapUrl = "";
  String _categoryName = "";
  String _categoryDescription = "";
  String _categoryId = "";

  // final ctrlCatId = TextEditingController(); // Id is not created with controller
  // final ctrlCatImageUrl = TextEditingController(); // Just to test
  // final ctrlCatMapUrl = TextEditingController();
  // final ctrlCatPosition = TextEditingController();

  @override
  void initState() {
    if (widget.category != null) {
      _categoryId = widget.category!.categoryId;
      _categoryName = widget.category!.categoryName;
      _categoryDescription = widget.category!.categoryDescription;
      _categoryImageUrl = widget.category!.categoryImage;
      _categoryMapUrl = widget.category!.categoryMap;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: BackWidget(
                    size: 50,
                    iconColor: Styles.whiteIconColor,
                  )),

              /// TODO: ADD Category name
              Expanded(
                child: TextField(
                  style: Styles.headlineStyle2,
                  controller: ctrlCatName,
                  decoration: InputDecoration(
                    hintText: "Add category name",
                    hintStyle: Styles.headlineStyle3
                        .copyWith(color: Styles.greyTextColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Styles.ctaMoreColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          // Destination title

          // Description

          // Floor plan
          Expanded(
            child: ListView(
                padding: EdgeInsets.only(top: 10, bottom: 80),
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0, bottom: 10, top: 10),
                    child: SizedBox(
                      width: double.infinity,

                      /// TODO: ADD Category description
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              minLines: null,
                              maxLines: null,
                              style: Styles.headlineStyle3,
                              controller: ctrlCatDescription,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10, right: 40),
                                hintText: "Add category description...",
                                hintStyle: Styles.headlineStyle3.copyWith(
                                    fontSize: 16, color: Styles.greyTextColor),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Styles.ctaMoreColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 8,
                              right: 10,
                              child: GestureDetector(
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: const DoneEditing())),
                        ],
                      ),
                    ),
                  ),
                  Stack(alignment: Alignment.center, children: [
                    GestureDetector(
                      onTap: () async {
                        // Step 1: choose image
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        print("------> File path: ${file?.path}");

                        if (file == null) return;
                        String uniqueFileName =
                        DateTime.now().microsecondsSinceEpoch.toString();
                        // Step 2: Upload image to cloudstore
                        // Get a reference to storage root
                        Reference referenceRoot =
                        FirebaseStorage.instance.ref();
                        Reference referenceDirMuseum = referenceRoot.child(
                            "YQXURRlJxRsCZpmRvhG2"); // TODO: Change with a variable in production
                        Reference referenceDirCategory = referenceDirMuseum
                            .child(widget.category!.categoryId);
                        Reference referenceCategoryImageToUpload =
                        referenceDirCategory.child(uniqueFileName);

                        // Handle errors
                        try {
                          await referenceCategoryImageToUpload
                              .putFile(File(file.path));

                          _categoryImageUrl =
                          await referenceCategoryImageToUpload
                              .getDownloadURL();
                        } catch (error) {
                          print("Error uploading an image: $error");
                        }
                      },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),


                      child: Column(
                        /// Add category main photo
                        children: [
                          Icon(
                            Icons.photo,
                            color: Styles.greyTextColor,
                            size: 60,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text("Add category photo."),
                        ],
                      ),
                    ),
                    ),
                  ]),
                  Stack(alignment: Alignment.center, children: [
                    GestureDetector(
                      // TODO: Add some animation when loading image to Cloudstore
                      onTap: () async{
                        // Step 1: choose image
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        print("------> File path: ${file?.path}");

                        if (file == null) return;
                        String uniqueFileName =
                        DateTime.now().microsecondsSinceEpoch.toString();
                        // Step 2: Upload image to cloudstore
                        // Get a reference to storage root
                        Reference referenceRoot =
                        FirebaseStorage.instance.ref();
                        Reference referenceDirMuseum = referenceRoot.child(
                            "YQXURRlJxRsCZpmRvhG2"); // TODO: Change with a variable in production
                        Reference referenceDirCategory = referenceDirMuseum
                            .child(widget.category!.categoryId);
                        Reference referenceCategoryImageToUpload =
                        referenceDirCategory.child(uniqueFileName);

                        // Handle errors
                        try {
                          await referenceCategoryImageToUpload
                              .putFile(File(file.path));

                          _categoryMapUrl =
                              await referenceCategoryImageToUpload
                              .getDownloadURL();
                        } catch (error) {
                          print("Error uploading an image: $error");
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      /// TODO: ADD Category map photo
                      children: [
                        Icon(
                          Icons.map_outlined,
                          color: Styles.greyTextColor,
                          size: 60,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text("Add category map."),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Styles.whiteIconColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Stack(alignment: Alignment.center, children: [
                  //   Container(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  //     margin: EdgeInsets.symmetric(vertical: 20),
                  //     height: 180,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   Column(
                  //     /// TODO: ADD Category map photo
                  //     children: [
                  //       Icon(
                  //         Icons.add_a_photo_outlined,
                  //         color: Styles.greyTextColor,
                  //         size: 60,
                  //       ),
                  //       SizedBox(
                  //         height: 12,
                  //       ),
                  //       Text("Add category main photo."),
                  //     ],
                  //   ),
                  //   SizedBox(
                  //     height: 20,
                  //   ),
                  // ]),
                  ListTile(
                    onTap: () {
                      print("Add subcategory");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    tileColor: Styles.ctaMoreColor,
                    leading: Icon(
                      Icons.add,
                      color: Styles.greyTextColor,
                      size: 50,
                    ),
                    title: Text(
                      "Add Category",
                      style: Styles.headlineStyle3
                          .copyWith(color: Styles.blackTextColor),
                    ),
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
