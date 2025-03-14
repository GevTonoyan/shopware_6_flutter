import 'dart:convert';

import 'package:rick_and_morty/features/feature_characters/data/data_source/local/characters_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _likeCharactersKey = 'likedCharactersKey';

class CharactersLocalDataSourceImpl implements CharactersLocalDataSource {
  final SharedPreferences preferences;

  const CharactersLocalDataSourceImpl(this.preferences);

  @override
  Future<Set<int>> getLikedCharacters() async {
    final likedIdsString = preferences.getString(_likeCharactersKey);

    if (likedIdsString != null) {
      final List<int> likedIds = List<int>.from(jsonDecode(likedIdsString));
      return likedIds.toSet();
    }
    return <int>{};
  }

  @override
  Future<void> toggleLikedCharacter(int id) async {
    final likedCharacters = await getLikedCharacters();

    if (likedCharacters.contains(id)) {
      likedCharacters.remove(id); // Unlike the character
    } else {
      likedCharacters.add(id); // Like the character
    }

    final likedIdsString = jsonEncode(likedCharacters.toList());
    await preferences.setString(_likeCharactersKey, likedIdsString);
  }
}
