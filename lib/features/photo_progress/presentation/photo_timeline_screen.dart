import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/photo_progress/data/photo_storage_service.dart';
import 'package:nutriq/features/photo_progress/presentation/photo_progress_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class PhotoTimelineScreen extends StatefulWidget {
  const PhotoTimelineScreen({super.key});

  @override
  State<PhotoTimelineScreen> createState() => _PhotoTimelineScreenState();
}

class _PhotoTimelineScreenState extends State<PhotoTimelineScreen> {
  late PhotoProgressBloc _bloc;
  final _photoStorageService = PhotoStorageService();

  @override
  void initState() {
    _bloc = locator<PhotoProgressBloc>();
    _bloc.add(LoadPhotos(
      startDate: DateTime.now().subtract(const Duration(days: 365)),
      endDate: DateTime.now(),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).photoProgressTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          NavigationOptions.photoCaptureRoute,
        ),
        child: const Icon(Icons.add_a_photo),
      ),
      body: BlocBuilder<PhotoProgressBloc, PhotoProgressState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is PhotoProgressLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PhotoProgressError) {
            return Center(child: Text(state.message));
          }
          if (state is PhotoProgressLoaded) {
            if (state.photos.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).noPhotosLabel,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.7),
                      ),
                ),
              );
            }
            return _buildTimeline(context, state.photos);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildTimeline(
      BuildContext context, List<PhotoProgressEntity> photos) {
    final grouped = <String, List<PhotoProgressEntity>>{};
    for (final photo in photos) {
      final key =
          '${photo.date.year}-${photo.date.month.toString().padLeft(2, '0')}';
      grouped.putIfAbsent(key, () => []).add(photo);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: grouped.length,
      itemBuilder: (context, index) {
        final key = grouped.keys.elementAt(index);
        final items = grouped[key]!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                key,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            SizedBox(
              height: 160,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) => _PhotoThumbnail(
                  photo: items[i],
                  photoStorageService: _photoStorageService,
                  onTap: () => _showPhotoOptions(context, items[i]),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  void _showPhotoOptions(BuildContext context, PhotoProgressEntity photo) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.visibility),
              title: Text(S.of(context).viewPhotoLabel),
              onTap: () {
                Navigator.pop(ctx);
                _viewPhoto(context, photo);
              },
            ),
            if (photo.note != null && photo.note!.isNotEmpty)
              ListTile(
                leading: const Icon(Icons.notes),
                title: Text(photo.note!),
                enabled: false,
              ),
            if (photo.tags.isNotEmpty)
              ListTile(
                leading: const Icon(Icons.label),
                title: Text(photo.tags),
                enabled: false,
              ),
            ListTile(
              leading:
                  Icon(Icons.delete, color: Theme.of(ctx).colorScheme.error),
              title: Text(S.of(context).dialogDeleteLabel,
                  style: TextStyle(color: Theme.of(ctx).colorScheme.error)),
              onTap: () {
                Navigator.pop(ctx);
                _confirmDelete(context, photo);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _viewPhoto(BuildContext context, PhotoProgressEntity photo) async {
    final fullPath = await _photoStorageService.getFullPath(photo.filePath);
    if (!mounted) return;
    Navigator.of(context).pushNamed(
      NavigationOptions.imageFullScreenRoute,
      arguments: fullPath,
    );
  }

  void _confirmDelete(BuildContext context, PhotoProgressEntity photo) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.of(context).deletePhotoLabel),
        content: Text(S.of(context).deletePhotoDialogContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(S.of(context).dialogCancelLabel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _bloc.add(DeletePhoto(photo));
            },
            child: Text(S.of(context).dialogDeleteLabel),
          ),
        ],
      ),
    );
  }
}

class _PhotoThumbnail extends StatelessWidget {
  final PhotoProgressEntity photo;
  final PhotoStorageService photoStorageService;
  final VoidCallback onTap;

  const _PhotoThumbnail({
    required this.photo,
    required this.photoStorageService,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: photoStorageService.getFullPath(photo.filePath),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            width: 120,
            height: 160,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        return GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 120,
              height: 160,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  kIsWeb
                      ? Image.network(
                          snapshot.data!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.broken_image),
                        )
                      : Image.asset(
                          snapshot.data!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.broken_image),
                        ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.black54,
                      child: Text(
                        '${photo.date.day.toString().padLeft(2, '0')}.'
                        '${photo.date.month.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
