import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'player_controller.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playerController = Get.put(PlayerController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Player'),
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  playerController.isShuffleMode.isTrue
                      ? Icons.shuffle
                      : Icons.shuffle_on,
                ),
                onPressed: playerController.toggleShuffleMode,
              )),
        ],
      ),
      body: Obx(() {
        if (playerController.currentPlaylist.isEmpty) {
          return Center(child: Text('No songs in the playlist'));
        } else {
          return ListView(
            children: playerController.currentPlaylist
                .map((song) => ListTile(
                      title: Text(song.title),
                      subtitle: Text(song.artist),
                    ))
                .toList(),
          );
        }
      }),
    );
  }
}