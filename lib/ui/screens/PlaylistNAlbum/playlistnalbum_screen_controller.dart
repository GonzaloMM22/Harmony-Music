import 'package:get/get.dart';
import '/models/playlist.dart';
import '/services/music_service.dart';

class PlayListNAlbumScreenController extends GetxController {
  var songList = <MediaItem>[].obs;
  var isContentFetched = false.obs;
  var additionalOperationMode = OperationMode.none.obs;
  late Playlist contentRenderer;

  // Existing methods...

  void onReorder(int oldIndex, int newIndex) {
    contentRenderer.reorderSongs(oldIndex, newIndex);
    songList.value = List.from(contentRenderer.songs);
    saveReorderedPlaylist();
  }

  void saveReorderedPlaylist() async {
    // Implement the logic to save the reordered playlist
    await Hive.box('LibraryPlaylists').put(contentRenderer.playlistId, contentRenderer.toJson());
  }
}