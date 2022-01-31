

import 'package:game_info_app/repository/models/addes_by_status.dart';
import 'package:game_info_app/repository/models/esrb_rating.dart';
import 'package:game_info_app/repository/models/genre.dart';
import 'package:game_info_app/repository/models/parent_platform.dart';
import 'package:game_info_app/repository/models/platform_element.dart';
import 'package:game_info_app/repository/models/rating.dart';
import 'package:game_info_app/repository/models/short_screenshot.dart';
import 'package:game_info_app/repository/models/store.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Result {
  Result({
    required this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.playtime,
    this.suggestionsCount,
    this.updated,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  final int id;
  final String? slug;
  final String? name;
  final DateTime? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final int? ratingTop;
  final List<Rating>? ratings;
  final int? ratingsCount;
  final int? reviewsTextCount;
  final int? added;
  final AddedByStatus? addedByStatus;
  final int? metacritic;
  final int? playtime;
  final int? suggestionsCount;
  final DateTime? updated;
  final String? userGame;
  final int? reviewsCount;
  final String? saturatedColor;
  final String? dominantColor;
  final List<PlatformElement>? platforms;
  final List<ParentPlatform>? parentPlatforms;
  final List<Genre>? genres;
  final List<Store>? stores;
  final String? clip;
  final List<Genre>? tags;
  final EsrbRating? esrbRating;
  final List<ShortScreenshot>? shortScreenshots;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}