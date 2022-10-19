part of 'models.dart';

class Anime {
  String? name;

  String? imageAsset;

  Anime({required this.name, required this.imageAsset});
}

var animeList = [
  Anime(
      name: "classroomtitle",
      imageAsset: "assets/images/classroomelitebackground.jpg"),
  Anime(
      name: "classroom1",
      imageAsset: "assets/images/classroomelitesquare1.jpg"),
  Anime(
      name: "classroom2",
      imageAsset: "assets/images/classroomelitesquare2.jpg"),
  Anime(
      name: "classroom3",
      imageAsset: "assets/images/classroomelitesquare3.jpg"),
  Anime(
      name: "classroom4", imageAsset: "assets/images/classroomelitesquare4.jpg")
];
