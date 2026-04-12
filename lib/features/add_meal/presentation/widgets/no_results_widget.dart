import 'package:flutter/material.dart';
import 'package:nutriq/generated/l10n.dart';

class NoResultsWidget extends StatelessWidget {
  final String? message;

  const NoResultsWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          const Icon(Icons.search_off, size: 64),
          const SizedBox(height: 16),
          Text(
            message ?? S.of(context).noResultsFound,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).noResultsHint,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
