import 'package:flutter/cupertino.dart';
import 'package:grocery_app/src/utils/styles.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? 'No Data',
        style: Styles.customStyle(
            textSize: TextSize.MEDIUM,
            textWeight: TextWeight.BOLD,
            tertiary: true),
      ),
    );
  }
}
