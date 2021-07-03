import 'package:flutter/material.dart';

double defaultMargin = 16.0;

Color primaryColor = Color(0xFF007B3D);
Color accentColor = Color(0xFF007B3D).withOpacity(0.5);
Color titleColor = Color(0xFF1D1D1D);
Color subtitleColor = Color(0xFF505050);
Color darkColor = Color(0xFF000000);
Color lightColor = Color(0xFFFFFFFF);
Color greyColor = Color(0XFFC4C4C4);
Color redColor = Colors.red;
Color backgroundColor1 = Color(0xFFFFFFFF);
Color backgroundColor2 = Color(0xFFFAFAFC);
Color backgroundColor3 = Color(0xFFE5E5E5);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  primary: primaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
);

ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
  primary: redColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
);

Border primaryBorder = Border.all(
  width: 1.0,
  color: primaryColor,
);

BoxShadow primaryBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.15),
  spreadRadius: 0,
  blurRadius: 24,
  offset: Offset(0, 8), // changes position of shadow
);
