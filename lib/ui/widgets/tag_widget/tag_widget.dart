import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unsplash/ui/resources/styles.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.tagColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: AppColors.textCustomColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(toBeginningOfSentenceCase(title) ?? ''),
      ),
    );
  }
}
