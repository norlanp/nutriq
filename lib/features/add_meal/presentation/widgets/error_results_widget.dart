import 'package:flutter/material.dart';
import 'package:nutriq/generated/l10n.dart';

class ErrorResultsWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorResultsWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          const Icon(Icons.cloud_off_outlined, size: 64),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh_outlined),
            label: Text(S.of(context).retryLabel),
          ),
        ],
      ),
    );
  }
}
