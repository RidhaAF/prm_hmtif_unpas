import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 16.0;
double defaultRadius = 8.0;

Color primaryColor = Color(0xFF007B3D);
Color accentColor = Color(0x00BC5D).withOpacity(0.5);
Color lightGreenColor = Color(0xFF00A351);
Color titleColor = Color(0xFF1D1D1D);
Color subtitleColor = Color(0xFF505050);
Color blackColor = Color(0xFF000000);
Color whiteColor = Color(0xFFFFFFFF);
Color lightColor = Color(0xFFFAFAFC);
Color greyColor = Color(0XFFC4C4C4);
Color lightGreyColor = Color(0XFFEEEEEE);
Color darkGreyColor = Color(0xFF999999);
Color redColor = Color(0XFFDD0000);
Color lightRedColor = Color(0XFFFF0000);
Color darkRedColor = Color(0XFFB63C2F);
Color yellowColor = Color(0XFFFFF500);
Color backgroundColor1 = Color(0xFFFFFFFF);
Color backgroundColor2 = Color(0xFFFAFAFC);
Color backgroundColor3 = Color(0xFFE5E5E5);

TextStyle primaryTextStyle = GoogleFonts.inter(
  color: primaryColor,
);

TextStyle titleTextStyle = GoogleFonts.inter(
  color: titleColor,
);

TextStyle subtitleTextStyle = GoogleFonts.inter(
  color: subtitleColor,
);

TextStyle whiteTextStyle = GoogleFonts.inter(
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.inter(
  color: greyColor,
);

TextStyle darkGreyTextStyle = GoogleFonts.inter(
  color: darkGreyColor,
);

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.zero,
  primary: primaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(defaultRadius),
  ),
  shadowColor: lightGreenColor,
);

ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.zero,
  primary: redColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(defaultRadius),
  ),
  shadowColor: lightRedColor,
);

Border primaryBorder = Border.all(
  width: 1.0,
  color: primaryColor,
);

BoxShadow primaryBoxShadow = BoxShadow(
  color: blackColor.withOpacity(0.10),
  spreadRadius: 0,
  blurRadius: 16,
  offset: Offset(0, 0), // changes position of shadow
);

LinearGradient primaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    primaryColor,
    lightGreenColor,
  ],
);

LinearGradient secondaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    lightRedColor,
    redColor,
  ],
);
