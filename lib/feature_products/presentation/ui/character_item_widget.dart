import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/core/ui_kit/theming/app_theme.dart';
import 'package:rick_and_morty/core/ui_kit/widgets/app_circle.dart';
import 'package:rick_and_morty/core/ui_kit/widgets/app_network_image.dart';

import 'package:rick_and_morty/features/feature_characters/domain/entities/character_page_entity.dart';

class CharacterItemWidget extends StatelessWidget {
  final CharacterEntity character;
  final VoidCallback? onTap;
  final VoidCallback? onLikeTap;
  final bool isLiked;

  const CharacterItemWidget({
    super.key,
    required this.character,
    this.isLiked = false,
    this.onTap,
    this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: appTheme.colorPalette.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Hero(
                      tag: character.id.toString(),
                      child: AppNetworkImage(
                        url: character.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: AppCircle(
                    onTap: onLikeTap,
                    width: 30,
                    height: 30,
                    color: appTheme.colorPalette.whiteSmoke,
                    child: SvgPicture.asset(
                      isLiked
                          ? 'assets/icons/liked.svg'
                          : 'assets/icons/unliked.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        appTheme.colorPalette.irisBlue,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(character.name, style: appTheme.typography.bodyBold),
            ),
          ],
        ),
      ),
    );
  }
}
