import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<LinearGradient?> generateGradient(String imageUrl) async {
  LinearGradient? backgroundGradient;

  try {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
    );

    final Color? dominantColor = paletteGenerator.dominantColor?.color;
    final Color? vibrantColor = paletteGenerator.vibrantColor?.color;
    final Color? mutedColor = paletteGenerator.mutedColor?.color;

    backgroundGradient = LinearGradient(
      colors: [
        Colors.transparent,
        mutedColor?.withAlpha((0.3 * 255).toInt()) ?? Colors.black38,
        vibrantColor?.withAlpha((0.5 * 255).toInt()) ?? Colors.black54,
        vibrantColor?.withAlpha((0.7 * 255).toInt()) ?? Colors.black87,
        dominantColor?.withAlpha((0.9 * 255).toInt()) ?? Colors.black,
      ],
      stops: const [0.0, 0.3, 0.6, 0.8, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return backgroundGradient;
  } catch (e) {
    debugPrint("Error loading gradient: $e");
  }
  return null;
}
