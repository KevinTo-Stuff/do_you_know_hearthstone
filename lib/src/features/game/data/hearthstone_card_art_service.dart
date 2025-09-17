import 'package:http/http.dart' as http;

class HearthstoneCardArtService {
  static const String _baseOrig = 'https://art.hearthstonejson.com/v1/orig/';
  static const String _base256 = 'https://art.hearthstonejson.com/v1/256x/';
  static const String _base512 = 'https://art.hearthstonejson.com/v1/512x/';

  /// Returns the full image URL for a given [cardId] and [size].
  /// [size] can be 'orig', '256x', or '512x'.
  String getArtUrl(String cardId, {String size = 'orig'}) {
    switch (size) {
      case '256x':
        return '$_base256$cardId.jpg';
      case '512x':
        return '$_base512$cardId.jpg';
      case 'orig':
      default:
        return '$_baseOrig$cardId.jpg';
    }
  }

  /// Fetches the image bytes for a given [cardId] and [size].
  /// Returns the raw bytes of the image.
  Future<http.Response> fetchArt(String cardId, {String size = 'orig'}) async {
    final url = getArtUrl(cardId, size: size);
    return await http.get(Uri.parse(url));
  }
}