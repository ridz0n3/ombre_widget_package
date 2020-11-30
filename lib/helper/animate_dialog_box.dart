
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ombre_widget_package/button/twin_button.dart';
import 'package:ombre_widget_package/header/header_text.dart';
import 'package:ombre_widget_package/header/normal_text.dart';
import 'package:ombre_widget_package/helper/utils.dart';

class animated_dialog_box {
  static Future showCustomAlertBox({
    @required BuildContext context,
    @required String title,
    @required String description,
    @required VoidCallback nextBtnPressed,
  }) {
    assert(context != null, "context is null!!");
    assert(title != null, "title is null!!");
    assert(description != null, "description is null!!");
    assert(nextBtnPressed != null, "next is null!!");
    return showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(setHeight(24))),
              ),
              contentPadding: EdgeInsets.all(0),
              insetPadding: EdgeInsets.symmetric(horizontal: setWidth(36.0), vertical: setHeight(36.0)),
              backgroundColor: Color(hexStringToHexInt('#E5040303')),
              content: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(setHeight(24))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeaderText(title: title, fontSize: 18, top: 25, left: 16, right: 16,),
                    Padding(
                      padding: EdgeInsets.only(
                        left: setWidth(25),
                        right: setWidth(25),
                        bottom: setHeight(25),
                      ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: setWidth(25),),
                            NormalText(
                              text: description,
                              align: AlignmentDirectional.center,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: TwinButton(
                        nextTitle: 'Yes',
                        nextBtnPressed: nextBtnPressed,
                        backTitle: 'No',
                      ),
                    ),//button
                  ],
                ),
              ),
              elevation: 10,
            ),
          );
        });
  }
}