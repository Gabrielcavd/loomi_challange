import 'package:flutter/material.dart';

class AppTheme {
  final TextTheme textTheme;

  const AppTheme(this.textTheme);

  static const int _darkGreyPrimaryValue = 0xFF131418;

// Degradê para Dark Grey Primary
  static const MaterialColor darkGreyPrimary = MaterialColor(
    _darkGreyPrimaryValue,
    <int, Color>{
      100: Color(0xFFE1E1E1),
      200: Color(0xFFC3C3C3),
      300: Color(0xFFA5A5A5),
      400: Color(0xFF878787),
      500: Color(_darkGreyPrimaryValue),
      600: Color(0xFF101112),
      700: Color(0xFF0D0E0F),
      800: Color(0xFF0A0B0C),
      900: Color(0xFF070809),
    },
  );

  static const int _purplePrimaryValue = 0xBC4CF1;

// Degradê para Purple Primary
  static const MaterialColor purplePrimary = MaterialColor(
    _purplePrimaryValue,
    <int, Color>{
      100: Color(0xFFE8D9F1),
      200: Color(0xFFD1B3E3),
      300: Color(0xFFBA8DD5),
      400: Color(0xFFA367C7),
      500: Color(_purplePrimaryValue),
      600: Color(0xFF8D4CB1),
      700: Color(0xFF77409B),
      800: Color(0xFF613385),
      900: Color(0xFF351F43),
    },
  );

  static const int _palleteWhiteValue = 0xffffffff;

  // Degradê para White
  static const MaterialColor palleteWhite = MaterialColor(
    _palleteWhiteValue,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(0xFFF8F8F8),
      300: Color(0xFFF0F0F0),
      400: Color(0xFFE8E8E8),
      500: Color(_palleteWhiteValue),
      600: Color(0xFFD8D8D8),
      700: Color(0xFFC0C0C0),
      800: Color(0xFFA8A8A8),
      900: Color(0xFF909090),
    },
  );

  static const int _palleteGreyValue = 0xFF616264;

  // Degradê para Grey
  static const MaterialColor palleteGrey = MaterialColor(
    _palleteGreyValue,
    <int, Color>{
      100: Color(0xFFE1E1E2),
      200: Color(0xFFC3C4C5),
      300: Color(0xFFA5A6A7),
      400: Color(0xFF87898A),
      500: Color(_palleteGreyValue),
      600: Color(0xFF565758),
      700: Color(0xFF4B4C4D),
      800: Color(0xFF404142),
      900: Color(0xFF353637),
    },
  );

  static const int _palleteGrey2Value = 0xff6C6D7A;

  // Degradê para Grey3
  static const MaterialColor palleteGrey2 = MaterialColor(
    _palleteGrey2Value,
    <int, Color>{
      100: Color(0xFFE0E0E0),
      200: Color(0xFFC0C0C0),
      300: Color(0xFFA0A0A0),
      400: Color(0xFF808080),
      500: Color(_palleteGrey2Value),
      600: Color(0xFF707070),
      700: Color(0xFF606060),
      800: Color(0xFF505050),
      900: Color(0xFF404040),
    },
  );

  static const int _palleteGrey4Value = 0xffd9d9d9;

  // Degradê para Grey4
  static const MaterialColor palleteGrey4 = MaterialColor(
    _palleteGrey4Value,
    <int, Color>{
      100: Color(0xFFFAFAFA),
      200: Color(0xFFE0E0E0),
      300: Color(0xFFCCCCCC),
      400: Color(0xFFB8B8B8),
      500: Color(_palleteGrey4Value),
      600: Color(0xFF8E8E8E),
      700: Color(0xFF6A6A6A),
      800: Color(0xFF454545),
      900: Color(0xFF212121),
    },
  );

  static const int _darkBlackValue = 0xff000000;

  // Degradê para Black
  static const MaterialColor darkBlack = MaterialColor(
    _darkBlackValue,
    <int, Color>{
      100: Color(0xFF333333),
      200: Color(0xFF262626),
      300: Color(0xFF1A1A1A),
      400: Color(0xFF0D0D0D),
      500: Color(_darkBlackValue),
      600: Color(0xFF080808),
      700: Color(0xFF050505),
      800: Color(0xFF020202),
      900: Color(0xFF000000),
    },
  );

  static const int _lightPurpleValue = 0xFFAA73F0;

// Degradê para Purple
  static const MaterialColor lightPurple = MaterialColor(
    _lightPurpleValue,
    <int, Color>{
      100: Color(0xFFEAD9FF),
      200: Color(0xFFD5B3FF),
      300: Color(0xFFC08CFF),
      400: Color(0xFFAB66FF),
      500: Color(_lightPurpleValue),
      600: Color(0xFF8A5BC0),
      700: Color(0xFF6A4790),
      800: Color(0xFF493360),
      900: Color(0xFF291F30),
    },
  );

  static const int _darkGreyValue = 0xFF23252C;

// Degradê para Dark Grey
  static const MaterialColor darkGrey = MaterialColor(
    _darkGreyValue,
    <int, Color>{
      100: Color(0xFFE3E4E6),
      200: Color(0xFFC7C9CC),
      300: Color(0xFFABADB3),
      400: Color(0xFF8F9199),
      500: Color(_darkGreyValue),
      600: Color(0xFF1F2127),
      700: Color(0xFF1B1D22),
      800: Color(0xFF17191D),
      900: Color(0xFF131417),
    },
  );

  static const int _darkGrey2Value = 0xff757a76;

  // Degradê para Dark Grey2
  static const MaterialColor darkGrey2 = MaterialColor(
    _darkGrey2Value,
    <int, Color>{
      100: Color(0xFFE8E8E8),
      200: Color(0xFFD1D1D1),
      300: Color(0xFFBABABA),
      400: Color(0xFFA3A3A3),
      500: Color(_darkGrey2Value),
      600: Color(0xFF8D8D8D),
      700: Color(0xFF777777),
      800: Color(0xFF616161),
      900: Color(0xFF4B4B4B),
    },
  );

  static const int _darkGrey3Value = 0xffa3a6a3;

  // Degradê para Dark Grey3
  static const MaterialColor darkGrey3 = MaterialColor(
    _darkGrey3Value,
    <int, Color>{
      100: Color(0xFFF2F2F2),
      200: Color(0xFFE4E4E4),
      300: Color(0xFFD6D6D6),
      400: Color(0xFFC8C8C8),
      500: Color(_darkGrey3Value),
      600: Color(0xFFBABABA),
      700: Color(0xFFACACAC),
      800: Color(0xFF9E9E9E),
      900: Color(0xFF909090),
    },
  );

  static const int _infoRedValue = 0xffE60000;

  // Degradê para Red
  static const MaterialColor infoRed = MaterialColor(
    _infoRedValue,
    <int, Color>{
      100: Color(0xFFFFE0E0),
      200: Color(0xFFFFC0C0),
      300: Color(0xFFFFA0A0),
      400: Color(0xFFFF8080),
      500: Color(_infoRedValue),
      600: Color(0xFFE60000),
      700: Color(0xFFB80000),
      800: Color(0xFF8C0000),
      900: Color(0xFF660000),
    },
  );

  static const int _lightColor1Value = 0xffd1d3d1;

  // Degradê para Light Color1
  static const MaterialColor lightColor1 = MaterialColor(
    _lightColor1Value,
    <int, Color>{
      100: Color(0xFFF2F4F2),
      200: Color(0xFFE5E7E5),
      300: Color(0xFFD9DAD9),
      400: Color(0xFFCCCCCC),
      500: Color(_lightColor1Value),
      600: Color(0xFFB0B3B0),
      700: Color(0xFF999C99),
      800: Color(0xFF838483),
      900: Color(0xFF6C6C6C),
    },
  );

  static const int _lightColor2Value = 0xffe8e9e9;

  // Degradê para Light Color2
  static const MaterialColor lightColor2 = MaterialColor(
    _lightColor2Value,
    <int, Color>{
      100: Color(0xFFF8F9F9),
      200: Color(0xFFF1F3F3),
      300: Color(0xFFE9ECEB),
      400: Color(0xFFD1D3D1),
      500: Color(_lightColor2Value),
      600: Color(0xFFBABBBB),
      700: Color(0xFFA3A4A3),
      800: Color(0xFF8B8D8B),
      900: Color(0xFF747674),
    },
  );

  static const int _lightColor5Value = 0xfffbfbfb;

  // Degradê para Light Color5
  static const MaterialColor lightColor5 = MaterialColor(
    _lightColor5Value,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFDFDFD),
      300: Color(0xFFFAFAFA),
      400: Color(0xFFF7F7F7),
      500: Color(_lightColor5Value),
      600: Color(0xFFEAEAEA),
      700: Color(0xFFD6D6D6),
      800: Color(0xFFC2C2C2),
      900: Color(0xFFAEAEAE),
    },
  );

  static ColorScheme lightScheme() {
    return ColorScheme(
      primary: purplePrimary,
      onPrimary: purplePrimary,
      secondary: palleteGrey.shade500,
      surface: lightColor5,
      error: infoRed.shade500,
      onSecondary: darkBlack.shade500,
      onSurface: darkBlack.shade900,
      onError: palleteWhite.shade500,
      brightness: Brightness.light,
    );
  }

  static ColorScheme darkScheme() {
    return ColorScheme(
      primary: purplePrimary.shade500,
      onPrimary: palleteWhite.shade500,
      secondary: palleteGrey.shade500,
      surface: darkGreyPrimary.shade500,
      error: infoRed.shade700,
      onSecondary: palleteGrey.shade700,
      onSurface: palleteGrey.shade500,
      onError: darkBlack.shade500,
      brightness: Brightness.dark,
    );
  }

  ThemeData lightTheme() => theme(lightScheme());
  ThemeData darkTheme() => theme(darkScheme());

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      fontFamily: "Epilogue",
      textTheme: textTheme.apply(
        decorationColor: colorScheme.error,
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
        decorationStyle: TextDecorationStyle.solid,
        fontFamily: "Epilogue",
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all<Color>(
            purplePrimary[700]!), // Thumb transparente
        trackColor:
            WidgetStateProperty.all<Color>(purplePrimary), // Cor da trilha
        radius: const Radius.circular(10), // Bordas arredondadas
        thickness: WidgetStateProperty.all<double>(8), // Espessura
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      cardTheme: CardTheme(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: colorScheme.onPrimary, width: 1),
        ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: lightColor5));
}
