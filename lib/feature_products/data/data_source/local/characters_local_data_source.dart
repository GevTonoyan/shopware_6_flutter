abstract interface class CharactersLocalDataSource {
  Future<Set<int>> getLikedCharacters();

  Future<void> toggleLikedCharacter(int id);
}
