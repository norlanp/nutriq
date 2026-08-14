import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/notifier/ai_scanner_notifier.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/notifier/ai_scanner_state.dart';
import 'package:nutriq/generated/l10n.dart';

class AiScannerScreen extends ConsumerStatefulWidget {
  const AiScannerScreen({super.key});

  @override
  ConsumerState<AiScannerScreen> createState() => _AiScannerScreenState();
}

class _AiScannerScreenState extends ConsumerState<AiScannerScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final state = ref.watch(aiScannerNotifierProvider);
    final notifier = ref.read(aiScannerNotifierProvider.notifier);

    ref.listen<AiScannerState>(aiScannerNotifierProvider, (prev, next) {
      if (next.status == AiScannerStatus.resultSelected &&
          next.selectedCandidate != null) {
        Navigator.of(context).pop(next.selectedCandidate);
      }
      if (next.status == AiScannerStatus.manualSearch) {
        context.go(AppRoutes.addMeal);
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.aiScannerTitle)),
      body: _buildBody(context, l10n, state, notifier),
    );
  }

  Widget _buildBody(
    BuildContext context,
    S l10n,
    AiScannerState state,
    AiScannerNotifier notifier,
  ) {
    if (state.status == AiScannerStatus.capturing || state.isLoading) {
      return _buildCapturingView(context);
    }
    if (state.status == AiScannerStatus.classified) {
      return _buildClassifiedView(context, l10n, state, notifier);
    }
    if (state.status == AiScannerStatus.error) {
      return _buildErrorView(context, l10n, state, notifier);
    }
    return _buildInitialView(context, l10n, notifier);
  }

  Widget _buildInitialView(
    BuildContext context,
    S l10n,
    AiScannerNotifier notifier,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_camera_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.aiScannerSubtitle,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          FilledButton.icon(
            onPressed: () => notifier.captureAndClassify(),
            icon: const Icon(Icons.camera_alt),
            label: Text(l10n.aiScannerCaptureButton),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => notifier.pickFromGallery(),
            icon: const Icon(Icons.photo_library),
            label: Text(l10n.aiScannerGalleryButton),
          ),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: () => notifier.manualSearchFallback(),
            icon: const Icon(Icons.search),
            label: Text(l10n.aiScannerSearchManually),
          ),
        ],
      ),
    );
  }

  Widget _buildCapturingView(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Processing image...'),
        ],
      ),
    );
  }

  Widget _buildClassifiedView(
    BuildContext context,
    S l10n,
    AiScannerState state,
    AiScannerNotifier notifier,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            l10n.aiScannerResultsTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              final candidate = state.results[index];
              final confidencePct = (candidate.confidence * 100)
                  .toStringAsFixed(0);
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  child: Text(
                    '$confidencePct%',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                title: Text(candidate.name),
                subtitle: Text(l10n.aiScannerConfidence(confidencePct)),
                trailing: IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    notifier.selectResult(candidate);
                  },
                ),
                onTap: () {
                  notifier.selectResult(candidate);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextButton.icon(
            onPressed: () => notifier.manualSearchFallback(),
            icon: const Icon(Icons.search),
            label: Text(l10n.aiScannerSearchManually),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorView(
    BuildContext context,
    S l10n,
    AiScannerState state,
    AiScannerNotifier notifier,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.aiScannerClassificationFailed,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => notifier.captureAndClassify(),
            child: Text(l10n.retryLabel),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () => notifier.manualSearchFallback(),
            icon: const Icon(Icons.search),
            label: Text(l10n.aiScannerSearchManually),
          ),
        ],
      ),
    );
  }
}
