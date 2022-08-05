import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/widgets/custom_primary_button.dart';

class CustomModalBottomSheet {
  CustomModalBottomSheet._();

  static builder({
    required BuildContext context,
    required bool isDismissible,
    required String title,
    required String body,
    VoidCallback? buttonOnPressed,
    String? buttonLabel,
  }) =>
      _modalBottomSheetBuilder(
        context: context,
        title: title,
        body: body,
        isDismissible: isDismissible,
        buttonOnPressed: buttonOnPressed,
        buttonLabel: buttonLabel,
      );

  static _modalBottomSheetBuilder({
    required BuildContext context,
    required bool isDismissible,
    required String title,
    required String body,
    VoidCallback? buttonOnPressed,
    String? buttonLabel,
  }) =>
      showModalBottomSheet(
          context: context,
          enableDrag: isDismissible,
          isDismissible: isDismissible,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          isScrollControlled: true,
          builder: (context) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Visibility(
                  visible: isDismissible,
                  child: Positioned(
                    right: 16,
                    top: -20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: CustomTheme.colors.white,
                        child: Icon(
                          Icons.close,
                          color: CustomTheme.colors.darkOrchid,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: CustomTheme.textStyles.titleBold(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        body,
                        style: CustomTheme.textStyles.bodyRegular(),
                      ),
                      if (buttonLabel != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: CustomPrimaryButton(
                            label: buttonLabel,
                            onPressed: () {
                              Navigator.pop(context);
                              buttonOnPressed!();
                            },
                          ),
                        ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            );
          });
}
