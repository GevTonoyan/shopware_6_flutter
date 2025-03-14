import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/api_provider/http_provider.dart';
import 'package:rick_and_morty/features/feature_characters/data/data_source/remote/characters_remote_data_source.dart';
import 'package:rick_and_morty/features/feature_characters/data/models/dto/character_dto.dart';
import 'package:rick_and_morty/features/feature_characters/data/models/mappers/character_page_mapper.dart';
import 'package:rick_and_morty/features/feature_characters/domain/entities/character_page_entity.dart';

class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {
  final HttpProvider apiProvider;
  final CharacterPageMapper characterPageMapper;

  const CharactersRemoteDataSourceImpl({
    required this.apiProvider,
    required this.characterPageMapper,
  });

  @override
  Future<CharacterPageEntity> getCharacters(int page) async {
    final response = await apiProvider.get(
      'character',
      params: {'page': page},
    );

    final res = response as Response<dynamic>;
    final dto = CharacterPageDto.fromJson(res.data as Map<String, dynamic>);
    return characterPageMapper.map(dto);
  }
}
