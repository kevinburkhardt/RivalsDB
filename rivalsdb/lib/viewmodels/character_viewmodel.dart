import 'package:flutter/foundation.dart';
import '../models/character.dart';
import '../services/character_service.dart';

class CharacterViewModel extends ChangeNotifier {
  final CharacterService _service = CharacterService();

  List<Character> _characters = [];
  bool _isLoading = false;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;

  Future<void> fetchCharacters() async {
    _isLoading = true;
    notifyListeners();

    _characters = await _service.loadCharacters();

    _isLoading = false;
    notifyListeners();
  }
}
