import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/photo_progress/data/photo_storage_service.dart';
import 'package:nutriq/features/photo_progress/presentation/notifier/photo_progress_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class PhotoCaptureScreen extends ConsumerStatefulWidget {
  const PhotoCaptureScreen({super.key});

  @override
  ConsumerState<PhotoCaptureScreen> createState() => _PhotoCaptureScreenState();
}

class _PhotoCaptureScreenState extends ConsumerState<PhotoCaptureScreen> {
  final _noteController = TextEditingController();
  final _tagsController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String? _selectedImagePath;
  final _photoStorageService = PhotoStorageService();

  @override
  void dispose() {
    _noteController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).photoProgressTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPhotoPreview(context),
          const SizedBox(height: 16.0),
          _buildPhotoPickerButtons(context),
          const SizedBox(height: 16.0),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(S.of(context).date),
            subtitle: Text(_formatDate(_selectedDate)),
            trailing: const Icon(Icons.calendar_today),
            onTap: _pickDate,
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: _tagsController,
            decoration: InputDecoration(
              labelText: S.of(context).photoTagsLabel,
              hintText: S.of(context).photoTagsHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12.0),
          TextField(
            controller: _noteController,
            decoration: InputDecoration(
              labelText: S.of(context).note,
              border: const OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: _selectedImagePath != null ? _savePhoto : null,
            child: Text(S.of(context).save),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoPreview(BuildContext context) {
    if (_selectedImagePath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 300),
          child: kIsWeb
              ? Image.network(
                  _selectedImagePath!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image, size: 64),
                )
              : Image.asset(
                  _selectedImagePath!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image, size: 64),
                ),
        ),
      );
    }
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Icon(
          Icons.add_a_photo_outlined,
          size: 64,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
        ),
      ),
    );
  }

  Widget _buildPhotoPickerButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _takePhoto,
            icon: const Icon(Icons.camera_alt_outlined),
            label: Text(S.of(context).photoCaptureButton),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _pickFromGallery,
            icon: const Icon(Icons.photo_library_outlined),
            label: Text(S.of(context).photoGalleryButton),
          ),
        ),
      ],
    );
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() => _selectedImagePath = image.path);
    }
  }

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _selectedImagePath = image.path);
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _savePhoto() async {
    if (_selectedImagePath == null) return;
    final relativePath =
        await _photoStorageService.savePhotoFromFile(_selectedImagePath!);
    final entity = PhotoProgressEntity(
      id: DateTime.now().millisecondsSinceEpoch,
      userId: 0,
      filePath: relativePath,
      date: _selectedDate,
      tags: _tagsController.text.trim().isEmpty
          ? ''
          : _tagsController.text.trim(),
      note: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
    );
    ref.read(photoProgressNotifierProvider.notifier).addPhoto(entity);
    if (mounted) Navigator.of(context).pop();
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }
}