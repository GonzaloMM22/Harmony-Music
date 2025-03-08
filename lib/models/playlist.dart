import '../models/thumbnail.dart';

class PlaylistContent {
  PlaylistContent({required this.title, required this.playlistList});
  final String title;
  final List<Playlist> playlistList;

  factory PlaylistContent.fromJson(Map<dynamic, dynamic> json) =>
      PlaylistContent(
          title: json['title'],
          playlistList: (json['playlists'] as List)
              .map((e) => Playlist.fromJson(e))
              .toList());
  Map<String, dynamic> toJson() => {
        "type": "Playlist Content",
        "title": title,
        "playlists": playlistList.map((e) => e.toJson()).toList()
      };
}

class Playlist {
  Playlist(
      {required this.title,
      required this.playlistId,
      this.description,
      required this.thumbnailUrl,
      this.songCount,
      this.isPipedPlaylist = false,
      this.isCloudPlaylist = true});
  final String playlistId;
  String title;
  final bool isPipedPlaylist;
  final String? description;
  final String thumbnailUrl;
  final String? songCount;
  final bool isCloudPlaylist;
  List<MediaItem> songs = [];

  factory Playlist.fromJson(Map<dynamic, dynamic> json) => Playlist(
      title: json["title"],
      playlistId: json["playlistId"] ?? json["browseId"],
      thumbnailUrl: Thumbnail(json["thumbnails"][0]["url"]).medium,
      description: json["description"] ?? "Playlist",
      songCount: json['itemCount'],
      isPipedPlaylist: json["isPipedPlaylist"] ?? false,
      isCloudPlaylist: json["isCloudPlaylist"] ?? true);

  Map<String, dynamic> toJson() => {
        "title": title,
        "playlistId": playlistId,
        "description": description,
        'thumbnails': [
          {'url': thumbnailUrl}
        ],
        "itemCount": songCount,
        "isPipedPlaylist": isPipedPlaylist,
        "isCloudPlaylist": isCloudPlaylist,
        "songs": songs.map((e) => e.toJson()).toList(),
      };

  set newTitle(String title) {
    this.title = title;
  }
  
  void reorderSongs(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final MediaItem item = songs.removeAt(oldIndex);
    songs.insert(newIndex, item);
  }
}