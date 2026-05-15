class MenuItemParserService {
  static final _pricePattern = RegExp(
    r'(?:[\$€£¥]\s*\d+[.,]?\d*|\d+[.,]?\d*\s*(?:\$|€|£|¥|USD|EUR|GBP|JPY))',
  );
  static final _sectionHeaderPattern = RegExp(
    r'^[A-Z\s]{2,}$',
  );
  static final _pageNumberPattern = RegExp(r'^\d+$');
  static final _dotsLeaderPattern = RegExp(r'\.{3,}');
  static final _dashLeaderPattern = RegExp(r'-{3,}');

  List<ParsedMenuItem> parseMenuText(String ocrText) {
    final lines = ocrText
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty)
        .toList();

    final items = <ParsedMenuItem>[];

    for (final line in lines) {
      if (_isSectionHeader(line) || _isMetadataLine(line)) {
        continue;
      }

      final parsed = _parseLine(line);
      if (parsed != null) {
        items.add(parsed);
      }
    }

    return items;
  }

  ParsedMenuItem? _parseLine(String line) {
    final cleaned = line
        .replaceAll(_dotsLeaderPattern, ' ')
        .replaceAll(_dashLeaderPattern, ' ')
        .trim();

    if (cleaned.isEmpty || cleaned.length < 2) return null;

    final priceMatch = _pricePattern.firstMatch(cleaned);
    double? price;
    String name;

    if (priceMatch != null) {
      final priceStr = priceMatch.group(0)!;
      price = _parsePrice(priceStr);
      name = cleaned.replaceFirst(priceMatch.group(0)!, '').trim();
    } else {
      name = cleaned;
    }

    name = _cleanName(name);
    if (name.isEmpty || name.length < 2) return null;
    if (_isSectionHeader(name)) return null;

    return ParsedMenuItem(
      name: name,
      price: price,
    );
  }

  bool _isSectionHeader(String line) {
    final trimmed = line.trim();
    if (trimmed.isEmpty) return false;
    if (_pageNumberPattern.hasMatch(trimmed)) return true;
    if (_sectionHeaderPattern.hasMatch(trimmed) && trimmed.length < 30) {
      return true;
    }
    final lower = trimmed.toLowerCase();
    final headerKeywords = [
      'appetizer',
      'appetizers',
      'starter',
      'starters',
      'entree',
      'entrees',
      'main course',
      'mains',
      'dessert',
      'desserts',
      'beverage',
      'beverages',
      'drink',
      'drinks',
      'side',
      'sides',
      'soup',
      'soups',
      'salad',
      'salads',
      'special',
      'specials',
      'vorspeise',
      'hauptgericht',
      'dessert',
      'getränk',
      'vorspeisen',
      'hauptgerichte',
      'getränke',
      'aperitif',
      'aperitifs',
      'plat',
      'plats',
      'meze',
      'mezeler',
      'içecek',
      'içecekler',
      'çorba',
      'çorbalar',
      'tatlı',
      'tatlılar',
      'ana yemek',
      'ana yemekler',
      'salata',
      'salatalar',
    ];
    return headerKeywords.contains(lower) ||
        (lower.length < 25 && lower == lower.toUpperCase() && lower.length > 1);
  }

  bool _isMetadataLine(String line) {
    final lower = line.toLowerCase().trim();
    final metadataPatterns = [
      'tel:',
      'phone:',
      'www.',
      'http',
      '@',
      'reservation',
      'all rights reserved',
      'hours:',
      'open:',
      'closed:',
    ];
    for (final pattern in metadataPatterns) {
      if (lower.contains(pattern)) return true;
    }
    return false;
  }

  String _cleanName(String name) {
    return name
        .replaceAll(RegExp(r'^[\s\-•·▪▸►→:]+'), '')
        .replaceAll(RegExp(r'[\s\-•·▪▸►→:]+$'), '')
        .replaceAll(RegExp(r'\s{2,}'), ' ')
        .trim();
  }

  double? _parsePrice(String priceStr) {
    final numStr = priceStr.replaceAll(RegExp(r'[^\d.,]'), '');
    if (numStr.isEmpty) return null;
    final normalized = numStr.replaceAll(',', '.');
    return double.tryParse(normalized);
  }
}

class ParsedMenuItem {
  final String name;
  final double? price;

  const ParsedMenuItem({
    required this.name,
    this.price,
  });

  @override
  String toString() => 'ParsedMenuItem(name: $name, price: $price)';
}
