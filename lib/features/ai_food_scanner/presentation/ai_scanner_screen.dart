import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/ai_scanner_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class AiScannerScreen extends StatefulWidget {
  const AiScannerScreen({super.key});

  @override
  State<AiScannerScreen> createState() => _AiScannerScreenState();
}

class _AiScannerScreenState extends State<AiScannerScreen> {
  late AiScannerBloc _bloc;

  @override
  void initState() {
    _bloc = locator<AiScannerBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.aiScannerTitle),
        ),
        body: BlocConsumer<AiScannerBloc, AiScannerState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is AiScannerResultSelected) {
              Navigator.of(context).pop(state.candidate);
            }
            if (state is AiScannerManualSearch) {
              Navigator.of(context)
                  .pushReplacementNamed(NavigationOptions.addMealRoute);
            }
          },
          builder: (context, state) {
            if (state is AiScannerCapturing) {
              return _buildCapturingView(context);
            }
            if (state is AiScannerClassified) {
              return _buildClassifiedView(context, state, l10n);
            }
            if (state is AiScannerError) {
              return _buildErrorView(context, state, l10n);
            }
            return _buildInitialView(context, l10n);
          },
        ),
      ),
    );
  }

  Widget _buildInitialView(BuildContext context, S l10n) {
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
            onPressed: () => _bloc.add(const CaptureAndClassify()),
            icon: const Icon(Icons.camera_alt),
            label: Text(l10n.aiScannerCaptureButton),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => _bloc.add(const PickFromGallery()),
            icon: const Icon(Icons.photo_library),
            label: Text(l10n.aiScannerGalleryButton),
          ),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: () => _bloc.add(const ManualSearchFallback()),
            icon: const Icon(Icons.search),
            label: Text(l10n.aiScannerSearchManually),
          ),
        ],
      ),
    );
  }

  // TODO: Replace with live camera viewfinder using camera plugin
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
    AiScannerClassified state,
    S l10n,
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
              final confidencePct =
                  (candidate.confidence * 100).toStringAsFixed(0);
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Text(
                    '$confidencePct%',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                title: Text(candidate.name),
                subtitle: Text(
                  l10n.aiScannerConfidence(confidencePct),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    _bloc.add(SelectResult(candidate: candidate));
                  },
                ),
                onTap: () {
                  _bloc.add(SelectResult(candidate: candidate));
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextButton.icon(
            onPressed: () => _bloc.add(const ManualSearchFallback()),
            icon: const Icon(Icons.search),
            label: Text(l10n.aiScannerSearchManually),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorView(
    BuildContext context,
    AiScannerError state,
    S l10n,
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
            state.message,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => _bloc.add(const CaptureAndClassify()),
            child: Text(l10n.retryLabel),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () => _bloc.add(const ManualSearchFallback()),
            icon: const Icon(Icons.search),
            label: Text(l10n.aiScannerSearchManually),
          ),
        ],
      ),
    );
  }
}
