import 'package:audioplayers/audio_cache.dart';

class AudioService {
  AudioCache cache;
  AudioService() {
    cache = AudioCache();
    cache.loadAll(['audio/dot.mp3', 'audio/dash.mp3']);
  }

  playDot() {
    cache.play('audio/dot.mp3');
  }

  playDash() {
    cache.play('audio/dash.mp3');
  }
}
