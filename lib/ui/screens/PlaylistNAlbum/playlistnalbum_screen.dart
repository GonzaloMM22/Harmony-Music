import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'playlistnalbum_screen_controller.dart';

class PlaylistNAlbumScreen extends StatelessWidget {
  const PlaylistNAlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tag = key.hashCode.toString();
    final playListNAlbumScreenController =
        Get.put(PlayListNAlbumScreenController(), tag: tag);

    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
        actions: [
          IconButton(
            icon: Icon(Icons.reorder),
            onPressed: () {
              // Toggle reorder mode
              playListNAlbumScreenController.toggleReorderMode();
            },
          )
        ],
      ),
      body: Obx(() {
        if (playListNAlbumScreenController.isContentFetched.isFalse) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ReorderableListView(
            onReorder: playListNAlbumScreenController.onReorder,
            children: playListNAlbumScreenController.songList
                .map((song) => ListTile(
                      key: ValueKey(song.id),
                      title: Text(song.title),
                      subtitle: Text(song.artist),
                      leading: Icon(Icons.drag_handle),
                    ))
                .toList(),
          );
        }
      }),
    );
  }
}