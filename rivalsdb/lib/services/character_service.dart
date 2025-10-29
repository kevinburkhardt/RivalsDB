import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/character.dart';

class CharacterService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Character>> loadCharacters() async {
    final snapshot = await _db.collection('heroes').get();
    return snapshot.docs
        .map((doc) => Character.fromFirestore(doc.data()))
        .toList();
  }

  Future<Character?> getCharacterByName(String name) async {
    final doc = await _db.collection('heroes').doc(name).get();
    if (doc.exists) {
      return Character.fromFirestore(doc.data()!);
    }
    return null;
  }
}
