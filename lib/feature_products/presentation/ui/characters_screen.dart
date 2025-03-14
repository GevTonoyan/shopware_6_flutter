import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/dependency_injection/dependency_injection.dart';
import 'package:rick_and_morty/core/routing/route_names.dart';
import 'package:rick_and_morty/core/ui_kit/theming/app_theme.dart';
import 'package:rick_and_morty/core/ui_kit/widgets/app_loader.dart';
import 'package:rick_and_morty/features/feature_characters/presentation/mobx/characters_store.dart';
import 'package:rick_and_morty/features/feature_characters/presentation/ui/character_item_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final CharactersStore charactersStore = sl<CharactersStore>();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    charactersStore.fetchLikedCharacters();
    charactersStore.fetchCharacters();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Observer(
            builder: (context) {
              if (charactersStore.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }

              if (charactersStore.isLoading &&
                  charactersStore.characters.isEmpty) {
                return const AppLoader();
              }

              final characters = charactersStore.characters;

              return RefreshIndicator(
                onRefresh: () async {
                  await charactersStore.refreshCharacters();
                },
                color: appTheme.colorPalette.irisBlue,
                child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    final character = characters[index];
                    return Observer(
                      builder: (_) {
                        return CharacterItemWidget(
                          character: character,
                          isLiked: charactersStore.likedCharacterIds
                              .contains(character.id),
                          onLikeTap: () {
                            charactersStore.toggleLikeCharacter(character.id);
                          },
                          onTap: () {
                            context.goNamed(
                              RouteNames.characterDetail,
                              pathParameters: {'id': character.id.toString()},
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.85) {
      charactersStore.fetchCharacters(isLoadMore: true);
    }
  }
}
