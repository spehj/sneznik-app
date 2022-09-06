import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back,
                    color: Styles.whiteIconColor,
                    size: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(
                        side:
                            BorderSide(width: 2, color: Styles.whiteIconColor)),
                    //padding: EdgeInsets.all(8),
                    primary: Styles.bgColor, // <-- Button color
                    onPrimary: Styles.oceanBlueColor, // <-- Splash color
                  ),
                ),
              ),

              // TODO: change with a variable
              Text(
                "First Floor",
                style: Styles.headlineStyle2,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // Destination title

          // Description

          Padding(
            padding: const EdgeInsets.only(left: 12),
            // TODO: fill with data from json
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Description",
                style:
                    Styles.headlineStyle2.copyWith(color: Styles.greyTextColor),
                textAlign: TextAlign.start,
              ),
            ),
          ),

          // Floor plan
          Expanded(
            child: ListView(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/castle-floor.jpg")),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: List.generate(6, (index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GridTile(
                            footer: GridTileBar(
                              backgroundColor: Styles.darkGrayColor,
                              title: Text(
                                "Wedding Room for Guests",
                                textAlign: TextAlign.center,
                                style: Styles.headlineStyle3.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Add action
                                // Navigator.of(context).pushNamed(
                                //     BookDetailScreen.routeName,
                                //     arguments: product.id,
                                // );
                              },
                              child: Image.asset(
                                "assets/images/IMG_3278_grad_sneznik_porocna_dvorana_big.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),]
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
