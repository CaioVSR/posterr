import 'package:flutter/widgets.dart';
import 'package:posterr/core/theme/custom_theme.dart';

class QuantityBadge extends StatelessWidget {
  final String label;
  final int quantity;

  const QuantityBadge({
    Key? key,
    required this.label,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          quantity <= 100 ? quantity.toString() : '100+',
          style: CustomTheme.textStyles.headerBold(color: CustomTheme.colors.newPurple),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: CustomTheme.textStyles.bodySmallLight(),
        ),
      ],
    );
  }
}
