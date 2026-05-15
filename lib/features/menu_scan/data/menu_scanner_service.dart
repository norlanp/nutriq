import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class MenuScannerService {
  final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  Future<String> captureAndScan() async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 90,
    );

    if (xFile == null) return '';

    return await scanImage(xFile.path);
  }

  Future<String> scanFromGallery() async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 90,
    );

    if (xFile == null) return '';

    return await scanImage(xFile.path);
  }

  Future<String> scanImage(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await _textRecognizer.processImage(inputImage);
    return recognizedText.text;
  }

  Future<List<RecognizedBlock>> scanWithBlocks(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await _textRecognizer.processImage(inputImage);

    final blocks = <RecognizedBlock>[];
    for (final block in recognizedText.blocks) {
      blocks.add(RecognizedBlock(
        text: block.text,
        left: block.boundingBox.left,
        top: block.boundingBox.top,
        width: block.boundingBox.width,
        height: block.boundingBox.height,
      ));
    }
    return blocks;
  }

  void dispose() {
    _textRecognizer.close();
  }
}

class RecognizedBlock implements Comparable<RecognizedBlock> {
  final String text;
  final double left;
  final double top;
  final double width;
  final double height;

  const RecognizedBlock({
    required this.text,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  @override
  int compareTo(RecognizedBlock other) => top.compareTo(other.top);
}
