import 'package:get/get.dart';
import '/models/media_item.dart';

class PlayerController extends GetxController {
  var isShuffleMode = false.obs;
  var currentPlaylist = <MediaItem>[].obs;

  // Existing methods...

  void toggleShuffleMode() {
    isShuffleMode.value = !isShuffleMode.value;
    if (isShuffleMode.isTrue) {
      currentPlaylist.shuffle();
    } else {
      // Restore original order if needed
    }
  }
}