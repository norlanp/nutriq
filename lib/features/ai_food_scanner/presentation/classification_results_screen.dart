import 'package:flutter/material.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/ai_food_scanner/domain/entity/food_candidate_entity.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/ai_scanner_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class ClassificationResultsScreen extends StatelessWidget {
  final List<FoodCandidateEntity> results;

  const ClassificationResultsScreen({
    super.key,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final bloc = locator<AiScannerBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aiScannerResultsTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final candidate = results[index];
                final confidencePct =
                    (candidate.confidence * 100).toStringAsFixed(0);
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      child: Text(
                        '$confidencePct%',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    title: Text(
                      candidate.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      l10n.aiScannerConfidence(confidencePct),
                    ),
                    trailing: Icon(
                      Icons.add_circle_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onTap: () {
                      Navigator.of(context).pop(candidate);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  bloc.add(const ManualSearchFallback());
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.search),
                label: Text(l10n.aiScannerSearchManually),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
