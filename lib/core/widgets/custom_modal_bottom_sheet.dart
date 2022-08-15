import 'package:flutter/material.dart';
import 'package:posterr/core/theme/custom_theme.dart';
import 'package:posterr/core/widgets/custom_primary_button.dart';

class CustomModalBottomSheet {
  CustomModalBottomSheet._();

  static post({
    required BuildContext context,
    required TextEditingController textController,
    required String title,
    required String body,
    required VoidCallback buttonOnPressed,
    String? buttonLabel,
  }) {
    const maxLength = 777;
    const maxLines = 20;

    return showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        isScrollControlled: true,
        builder: (context) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              const CloseModal(isDismissible: true),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: textController,
                      maxLength: maxLength,
                      autofocus: true,
                      maxLines: maxLines,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  CustomPrimaryButton(label: CustomTheme.imagesPaths.chatLogo, onPressed: buttonOnPressed),
                ],
              )
            ],
          );
        });
  }

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
                CloseModal(isDismissible: isDismissible),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Message(
                    title: title,
                    body: body,
                    buttonOnPressed: buttonOnPressed,
                    buttonLabel: buttonLabel,
                  ),
                ),
              ],
            );
          });
}

class Message extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback? buttonOnPressed;
  final String? buttonLabel;

  const Message({
    Key? key,
    required this.title,
    required this.body,
    this.buttonOnPressed,
    this.buttonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
              label: buttonLabel!,
              onPressed: () {
                Navigator.pop(context);
                buttonOnPressed!();
              },
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class CloseModal extends StatelessWidget {
  final bool isDismissible;

  const CloseModal({
    Key? key,
    required this.isDismissible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
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
    );
  }
}
