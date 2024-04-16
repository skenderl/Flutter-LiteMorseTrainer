import "package:just_audio/just_audio.dart";

import "package:morse_learn/helpers/helpers.dart";
import "package:morse_learn/models/models.dart";

abstract final class AudioService {
  static final _listPlayer = AudioPlayer()..setShuffleModeEnabled(false);
  static final _dotPlayer = AudioPlayer();
  static final _dashPlayer = AudioPlayer();

  static Future<void> play(List<MorseUnit> units) async {
    final playlist = ConcatenatingAudioSource(
      children: units
          .map(
            (unit) => unit == MorseUnit.dot
                ? AudioSource.asset(AssetsAudios.dot)
                : AudioSource.asset(AssetsAudios.dash),
          )
          .toList(),
    );

    await _listPlayer.setAudioSource(
      playlist,
      initialIndex: 0,
      initialPosition: Duration.zero,
    );

    await _listPlayer.play();
  }

  static Future<void> playUnit(MorseUnit unit) async {
    return unit == MorseUnit.dot ? _playDot() : _playDash();
  }

  static Future<void> _playDot() async {
    await _dotPlayer.setAudioSource(
      AudioSource.asset(AssetsAudios.dot),
    );
    await _dotPlayer.play();
  }

  static Future<void> _playDash() async {
    await _dashPlayer.setAudioSource(
      AudioSource.asset(AssetsAudios.dash),
    );
    await _dashPlayer.play();
  }
}
