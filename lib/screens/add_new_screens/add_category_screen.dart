import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sneznik_app/services/category_service.dart';

import '../../models/category_model.dart';
import '../../services/firebase_services.dart';
import '../../utils/app_styles.dart';
import '../../widgets/category_widgets.dart';
import '../../widgets/next_widget.dart';
import '../home_screen.dart';

class AddCategoryScreen extends StatefulWidget {
  // final double? categoryLength;
  final Category? category;

  const AddCategoryScreen({
    Key? key,
    required this.category,
    /*required this.categoryLength*/
  }) : super(key: key);

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
  double? _categoryPosition;
  final String museumId = "YQXURRlJxRsCZpmRvhG2";
  bool _descButtonVisible = false;
  bool _descriptionVisible = false;
  late FocusNode _descriptionFocus;
  final ValueNotifier<bool> updateButtonState = ValueNotifier(false);
  XFile? _categoryPhotoFile;
  XFile? _categoryMapPhotoFile;

  changeDescButtonVisibility(String descript, {bool force = false}) {
    if (descript != "" && !_descButtonVisible && !force) {
      print("CHANGED SOME TEXT");
      _descButtonVisible = true;
    } else if (descript == "" && _descButtonVisible && !force) {
      print("CHANGED NO TEXT: $descript");
      _descButtonVisible = false;
    } else if (descript != "" && _descriptionVisible && force) {
      _descButtonVisible = false;
    }
    updateButtonState.value = _descButtonVisible;
  }

  // final ctrlCatId = TextEditingController(); // Id is not created with controller
  // final ctrlCatImageUrl = TextEditingController(); // Just to test
  // final ctrlCatMapUrl = TextEditingController();
  // final ctrlCatPosition = TextEditingController();

  @override
  void initState() {
    _categoryPosition =
        Provider.of<NumberOfCategories>(context).numberOfCategories;
    _categoryPosition ??= 0;
    if (widget.category != null) {
      /// Existing category is displayed
      _categoryId = widget.category!.categoryId;
      _categoryName = widget.category!.categoryName;
      _categoryDescription = widget.category!.categoryDescription;
      _categoryImageUrl = widget.category!.categoryImage;
      _categoryMapUrl = widget.category!.categoryMap;
      // _categoryPosition = widget.categoryLength;
      _descButtonVisible = true;

      // _categoryPosition =
      //     Provider.of<NumberOfCategories>(context).numberOfCategories;
      _categoryPosition = context.watch()<NumberOfCategories>().numberOfCategories;
      print("Category length: $_categoryPosition");
    } else {
      /// New category to add
      // Get existing category ID
      _categoryId = FirebaseFirestore.instance
          .collection("museum")
          .doc(museumId)
          .collection("categories")
          .doc()
          .id;
    }

    print("Number of categories: $_categoryPosition");

    _descriptionFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    ctrlCatName.dispose();
    ctrlCatDescription.dispose();
    _descriptionFocus = FocusNode();
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
                  controller: ctrlCatName..text = _categoryName,
                  onSubmitted: (value) {
                    if (value != "") {
                      setState(() {
                        // TODO: Add some input show/hide
                        // _contentVisible = true;
                        _categoryName = ctrlCatName.value.text;
                        _descriptionVisible = true;
                        _descriptionFocus.requestFocus();
                        print("Category name: $_categoryName");
                        //print("------> Category name: ${_categoryName}");
                      });
                    }
                  },
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
          Visibility(
            visible: _descriptionVisible,
            child: Expanded(
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
                                focusNode: _descriptionFocus,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                minLines: null,
                                maxLines: null,
                                style: Styles.headlineStyle3,
                                controller: ctrlCatDescription
                                  ..text = _categoryDescription,
                                onTap: () {
                                  changeDescButtonVisibility(
                                      _categoryDescription);
                                },
                                onSubmitted: (value) {
                                  if (value != "") {
                                    setState(() {
                                      // TODO: Add some input show/hide
                                      // _contentVisible = true;
                                      _categoryDescription = value;
                                    });
                                  }
                                },
                                onChanged: (value) {
                                  changeDescButtonVisibility(value);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10, right: 40),
                                  hintText: "Add category description...",
                                  hintStyle: Styles.headlineStyle3.copyWith(
                                      fontSize: 16,
                                      color: Styles.greyTextColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Styles.ctaMoreColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ValueListenableBuilder(
                                valueListenable: updateButtonState,
                                builder: (context, bool val, child) {
                                  return Visibility(
                                    visible: val,
                                    child: Positioned(
                                        bottom: 8,
                                        right: 10,
                                        child: GestureDetector(
                                            onTap: () {
                                              if (ctrlCatDescription
                                                      .value.text !=
                                                  "") {
                                                setState(() {
                                                  // TODO: Add some input show/hide
                                                  // _contentVisible = true;
                                                  _categoryDescription =
                                                      ctrlCatDescription
                                                          .value.text;
                                                });
                                              }
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                              print("--------->>>");
                                              changeDescButtonVisibility(
                                                  _categoryDescription,
                                                  force: true);
                                            },
                                            child: const DoneEditing())),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                    Stack(alignment: Alignment.center, children: [
                      GestureDetector(
                          onTap: () async {
                            // Step 1: choose image
                            ImagePicker imagePicker = ImagePicker();
                            XFile? tempCategoryImage = await imagePicker
                                .pickImage(source: ImageSource.gallery);
                            print(
                                "------> File path: ${tempCategoryImage?.path}");

                            if (tempCategoryImage == null) return;

                            setState(() {
                              _categoryPhotoFile = tempCategoryImage;
                            });
                            String uniqueFileName = DateTime.now()
                                .microsecondsSinceEpoch
                                .toString();
                            // Step 2: Upload image to cloudstore
                            // Get a reference to storage root
                            Reference referenceRoot =
                                FirebaseStorage.instance.ref();
                            Reference referenceDirMuseum = referenceRoot.child(
                                museumId); // TODO: Change with a variable in production
                            Reference referenceDirCategory =
                                referenceDirMuseum.child(_categoryId);
                            Reference referenceCategoryImageToUpload =
                                referenceDirCategory.child(uniqueFileName);

                            // Handle errors
                            try {
                              await referenceCategoryImageToUpload
                                  .putFile(File(_categoryPhotoFile!.path));

                              _categoryImageUrl =
                                  await referenceCategoryImageToUpload
                                      .getDownloadURL();
                            } catch (error) {
                              print("Error uploading an image: $error");
                            }
                          },
                          child: _categoryPhotoFile != null
                              ? CategoryPhotoLoaded(
                                  categoryPhotoFile: _categoryPhotoFile,
                                  height: 180,
                                )
                              : const AddCategoryPhotoWidget(
                                  icon: Icons.photo_outlined,
                                  height: 180,
                                  helperText: "Add category main image.",
                                )

                          // Container(
                          //   padding:
                          //       EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          //   margin: EdgeInsets.symmetric(vertical: 20),
                          //   height: 180,
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20),
                          //     color: Colors.white,
                          //   ),
                          //   child:
                          //   /// Here show Column with photo icon if no photo is selected.
                          //   /// And show photo if one has been selected
                          //
                          //   _categoryPhotoFile != null? Image.file(File(_categoryPhotoFile!.path), fit: BoxFit.cover,): const AddCategoryPhotoWidget()
                          // ),
                          ),
                    ]),
                    Stack(alignment: Alignment.center, children: [
                      GestureDetector(
                          // TODO: Add some animation when loading image to Cloudstore
                          onTap: () async {
                            // Step 1: choose image
                            ImagePicker imagePicker = ImagePicker();
                            XFile? tempCategoryImage = await imagePicker
                                .pickImage(source: ImageSource.gallery);
                            print(
                                "------> File path: ${tempCategoryImage?.path}");

                            if (tempCategoryImage == null) return;

                            setState(() {
                              _categoryMapPhotoFile = tempCategoryImage;
                            });
                            String uniqueFileName = DateTime.now()
                                .microsecondsSinceEpoch
                                .toString();
                            // Step 2: Upload image to cloudstore
                            // Get a reference to storage root
                            Reference referenceRoot =
                                FirebaseStorage.instance.ref();
                            Reference referenceDirMuseum = referenceRoot.child(
                                museumId); // TODO: Change with a variable in production
                            Reference referenceDirCategory =
                                referenceDirMuseum.child(_categoryId);
                            Reference referenceCategoryImageToUpload =
                                referenceDirCategory.child(uniqueFileName);

                            // Handle errors
                            try {
                              await referenceCategoryImageToUpload
                                  .putFile(File(_categoryMapPhotoFile!.path));

                              _categoryMapUrl =
                                  await referenceCategoryImageToUpload
                                      .getDownloadURL();
                            } catch (error) {
                              print("Error uploading an image: $error");
                            }
                          },
                          child: _categoryMapPhotoFile != null
                              ? CategoryPhotoLoaded(
                                  categoryPhotoFile: _categoryMapPhotoFile,
                                  height: 250,
                                )
                              : const AddCategoryPhotoWidget(
                                  icon: Icons.map_outlined,
                                  height: 250,
                                  helperText: "Add category map image.",
                                )),
                    ]),
                    SizedBox(
                      height: 20,
                    ),

                    /// TODO: next (if (_categoryName != null)),
                    ListTile(
                      onTap: () async {
                        // TODO: send data to firestore
                        if (widget.category == null) {
                          print(
                              "---------> Category name if new category: ${_categoryName}");
                          print(
                              "---------> Category desc if new category: ${_categoryDescription}");

                          CategoryServices().createCategory(
                              categoryName: _categoryName,
                              categoryDescription: _categoryDescription,
                              categoryImage: _categoryImageUrl,
                              categoryMap: _categoryMapUrl,
                              categoryPosition: _categoryPosition!.toInt());
                        }
                        print("Add category");
                        Navigator.pop(context);
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
                        widget.category == null
                            ? "Add Category"
                            : "Update category",
                        style: Styles.headlineStyle3
                            .copyWith(color: Styles.blackTextColor),
                      ),
                    )
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
