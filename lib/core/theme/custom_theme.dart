import 'package:posterr/core/theme/custom_colors.dart';
import 'package:posterr/core/theme/custom_text_styles.dart';
import 'package:posterr/core/theme/images_paths.dart';

class CustomTheme {
  const CustomTheme._();

  static CustomColors get colors => CustomColors.instance;
  static CustomTextStyles get textStyles => CustomTextStyles.instance;
  static ImagesPaths get imagesPaths => ImagesPaths.instance;
}
