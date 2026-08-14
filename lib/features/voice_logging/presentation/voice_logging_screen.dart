import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/voice_logging/domain/entity/voice_food_entry_entity.dart';
import 'package:nutriq/features/voice_logging/presentation/notifier/voice_logging_notifier.dart';
import 'package:nutriq/features/voice_logging/presentation/notifier/voice_logging_state.dart';
import 'package:nutriq/generated/l10n.dart';

class VoiceLoggingScreen extends ConsumerStatefulWidget {
  const VoiceLoggingScreen({super.key});

  @override
  ConsumerState<VoiceLoggingScreen> createState() => _VoiceLoggingScreenState();
}

class _VoiceLoggingScreenState extends ConsumerState<VoiceLoggingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(voiceLoggingNotifierProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final state = ref.watch(voiceLoggingNotifierProvider);
    final notifier = ref.read(voiceLoggingNotifierProvider.notifier);

    ref.listen<VoiceLoggingState>(voiceLoggingNotifierProvider, (prev, next) {
      if (next.status == VoiceLoggingStatus.error &&
          next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
      if (next.status == VoiceLoggingStatus.confirmed) {
        Navigator.of(context).pop(next.selectedEntries);
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.voiceLoggingTitle)),
      body: _buildBody(context, l10n, state, notifier),
    );
  }

  Widget _buildBody(
    BuildContext context,
    S l10n,
    VoiceLoggingState state,
    VoiceLoggingNotifier notifier,
  ) {
    return switch (state.status) {
      VoiceLoggingStatus.initializing => const Center(
        child: CircularProgressIndicator(),
      ),
      VoiceLoggingStatus.ready => _buildReadyView(
        context,
        l10n,
        state,
        notifier,
      ),
      VoiceLoggingStatus.listening => _buildListeningView(
        context,
        l10n,
        state,
        notifier,
      ),
      VoiceLoggingStatus.parsing => _buildParsingView(context, l10n),
      VoiceLoggingStatus.parsed => _buildParsedView(
        context,
        l10n,
        state,
        notifier,
      ),
      VoiceLoggingStatus.confirmed => const Center(
        child: CircularProgressIndicator(),
      ),
      VoiceLoggingStatus.error => _buildErrorView(
        context,
        l10n,
        state,
        notifier,
      ),
      _ => _buildReadyView(
        context,
        l10n,
        const VoiceLoggingState(status: VoiceLoggingStatus.ready),
        notifier,
      ),
    };
  }

  Widget _buildReadyView(
    BuildContext context,
    S l10n,
    VoiceLoggingState state,
    VoiceLoggingNotifier notifier,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.mic_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.voiceLoggingSubtitle,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          if (state.transcription.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                state.transcription,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
          const SizedBox(height: 40),
          FilledButton.icon(
            onPressed: () => notifier.startListening(),
            icon: const Icon(Icons.mic),
            label: Text(l10n.voiceLoggingStartButton),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
            label: Text(l10n.dialogCancelLabel),
          ),
        ],
      ),
    );
  }

  Widget _buildListeningView(
    BuildContext context,
    S l10n,
    VoiceLoggingState state,
    VoiceLoggingNotifier notifier,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.errorContainer,
            ),
            child: Icon(
              Icons.mic,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.voiceLoggingListening,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (state.transcription.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                state.transcription,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
          const SizedBox(height: 40),
          FilledButton.icon(
            onPressed: () => notifier.stopListening(),
            icon: const Icon(Icons.stop),
            label: Text(l10n.voiceLoggingStopButton),
          ),
        ],
      ),
    );
  }

  Widget _buildParsingView(BuildContext context, S l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            l10n.voiceLoggingParsing,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildParsedView(
    BuildContext context,
    S l10n,
    VoiceLoggingState state,
    VoiceLoggingNotifier notifier,
  ) {
    final allSelected = state.entries.every(
      (e) => state.selectedEntries.containsKey(e),
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            l10n.voiceLoggingResultsTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.record_voice_over,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    state.transcription,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: state.entries.length,
            itemBuilder: (context, index) {
              final entry = state.entries[index];
              final candidates = state.foodCandidates[entry] ?? [];
              final selected = state.selectedEntries[entry];

              return _FoodEntryCard(
                entry: entry,
                candidates: candidates,
                selectedCandidate: selected,
                onCandidateSelected: (candidate) {
                  notifier.selectFoodCandidate(entry, candidate);
                },
                onRemove: () {
                  notifier.removeVoiceEntry(entry);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => notifier.reset(),
                  child: Text(l10n.voiceLoggingRetryButton),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: allSelected
                      ? () => notifier.confirmEntries()
                      : null,
                  child: Text(l10n.voiceLoggingConfirmButton),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorView(
    BuildContext context,
    S l10n,
    VoiceLoggingState state,
    VoiceLoggingNotifier notifier,
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
            state.errorMessage ?? '',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => notifier.initialize(),
            child: Text(l10n.retryLabel),
          ),
        ],
      ),
    );
  }
}

class _FoodEntryCard extends StatelessWidget {
  final VoiceFoodEntryEntity entry;
  final List<MealEntity> candidates;
  final MealEntity? selectedCandidate;
  final ValueChanged<MealEntity> onCandidateSelected;
  final VoidCallback onRemove;

  const _FoodEntryCard({
    required this.entry,
    required this.candidates,
    this.selectedCandidate,
    required this.onCandidateSelected,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    _formatEntry(entry),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: onRemove,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            if (candidates.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  l10n.voiceLoggingNoMatches,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              )
            else
              RadioGroup<MealEntity>(
                groupValue: selectedCandidate,
                onChanged: (value) {
                  if (value != null) onCandidateSelected(value);
                },
                child: Column(
                  children: candidates
                      .take(3)
                      .map(
                        (candidate) => RadioListTile<MealEntity>(
                          value: candidate,
                          title: Text(
                            candidate.name ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: candidate.brands != null
                              ? Text(
                                  candidate.brands!,
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              : null,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatEntry(VoiceFoodEntryEntity entry) {
    if (entry.quantity != null && entry.unit != null) {
      return '${entry.quantity} ${entry.unit} ${entry.description}';
    }
    if (entry.quantity != null) {
      return '${entry.quantity} ${entry.description}';
    }
    return entry.description;
  }
}
