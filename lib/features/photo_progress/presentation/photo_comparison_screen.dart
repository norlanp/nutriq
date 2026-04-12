import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:nutriq/features/photo_progress/data/photo_storage_service.dart';
import 'package:nutriq/generated/l10n.dart';

class PhotoComparisonScreen extends StatefulWidget {
  final PhotoProgressEntity beforePhoto;
  final PhotoProgressEntity afterPhoto;

  const PhotoComparisonScreen({
    super.key,
    required this.beforePhoto,
    required this.afterPhoto,
  });

  @override
  State<PhotoComparisonScreen> createState() => _PhotoComparisonScreenState();
}

class _PhotoComparisonScreenState extends State<PhotoComparisonScreen> {
  double _sliderPosition = 0.5;
  final _photoStorageService = PhotoStorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).photoComparisonTitle)),
      body: FutureBuilder(
        future: _loadPhotoPaths(),
        builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final paths = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        setState(() {
                          _sliderPosition +=
                              details.primaryDelta! / constraints.maxWidth;
                          _sliderPosition = _sliderPosition.clamp(0.0, 1.0);
                        });
                      },
                      child: Stack(
                        children: [
                          ClipRect(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              widthFactor: 1.0,
                              child: _buildImage(paths['after']!),
                            ),
                          ),
                          ClipRect(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              widthFactor: _sliderPosition,
                              child: _buildImage(paths['before']!),
                            ),
                          ),
                          Positioned(
                            left: _sliderPosition * constraints.maxWidth - 1,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            left: _sliderPosition * constraints.maxWidth - 16,
                            top: constraints.maxHeight / 2 - 16,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.compare_arrows,
                                size: 20,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLabel(context, S.of(context).beforeLabel,
                        widget.beforePhoto.date),
                    _buildLabel(context, S.of(context).afterLabel,
                        widget.afterPhoto.date),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String label, DateTime date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        Text(
          '${date.day.toString().padLeft(2, '0')}.'
          '${date.month.toString().padLeft(2, '0')}.'
          '${date.year}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Future<Map<String, String>> _loadPhotoPaths() async {
    final beforePath =
        await _photoStorageService.getFullPath(widget.beforePhoto.filePath);
    final afterPath =
        await _photoStorageService.getFullPath(widget.afterPhoto.filePath);
    return {'before': beforePath, 'after': afterPath};
  }

  Widget _buildImage(String path) {
    if (kIsWeb) {
      return Image.network(
        path,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
      );
    }
    return Image.asset(
      path,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
    );
  }
}
