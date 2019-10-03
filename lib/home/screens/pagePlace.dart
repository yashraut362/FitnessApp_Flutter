import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audio/audio.dart';



class AudioRecorder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AudioRecorderState();
}

class AudioRecorderState extends State<AudioRecorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        children: <Widget>[Text("Audio Recorder")],
      ),
    );
  }
}

@immutable
class AudioPlayerDemo extends StatefulWidget {
  final String url;

  AudioPlayerDemo(this.url);

  @override
  State<StatefulWidget> createState() => AudioPlayerDemoState();
}

class AudioPlayerDemoState extends State<AudioPlayerDemo> {
  Audio audioPlayer = new Audio(single: true);
  AudioPlayerState state = AudioPlayerState.STOPPED;
  double position = 0;
  int buffering = 0;
  StreamSubscription<AudioPlayerState> _playerStateSubscription;
  StreamSubscription<double> _playerPositionController;
  StreamSubscription<int> _playerBufferingSubscription;
  StreamSubscription<AudioPlayerError> _playerErrorSubscription;

  @override
  void initState() {
    _playerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      print("onPlayerStateChanged: ${audioPlayer.uid} $state");

      if (mounted) setState(() => this.state = state);
    });

    _playerPositionController =
        audioPlayer.onPlayerPositionChanged.listen((double position) {
      print(
          "onPlayerPositionChanged: ${audioPlayer.uid} $position ${audioPlayer.duration}");

      if (mounted) setState(() => this.position = position);
    });

    _playerBufferingSubscription =
        audioPlayer.onPlayerBufferingChanged.listen((int percent) {
      print("onPlayerBufferingChanged: ${audioPlayer.uid} $percent");

      if (mounted && buffering != percent) setState(() => buffering = percent);
    });

    _playerErrorSubscription =
        audioPlayer.onPlayerError.listen((AudioPlayerError error) {
      throw ("onPlayerError: ${error.code} ${error.message}");
    });

    audioPlayer.preload(widget.url);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget status = Container();

    print(
        "[build] uid=${audioPlayer.uid} duration=${audioPlayer.duration} state=$state");

    switch (state) {
      case AudioPlayerState.LOADING:
        {
          status = Container(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 24.0,
                height: 24.0,
                child: Center(
                    child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    CircularProgressIndicator(strokeWidth: 2.0),
                    Text("${buffering}%",
                        style: TextStyle(fontSize: 8.0),
                        textAlign: TextAlign.center)
                  ],
                )),
              ));
          break;
        }

      case AudioPlayerState.PLAYING:
        {
          status = IconButton(
              icon: Icon(Icons.pause, size: 28.0), onPressed: onPause);
          break;
        }

      case AudioPlayerState.READY:
      case AudioPlayerState.PAUSED:
      case AudioPlayerState.STOPPED:
        {
          status = IconButton(
              icon: Icon(Icons.play_arrow, size: 28.0), onPressed: onPlay);

          if (state == AudioPlayerState.STOPPED) audioPlayer.seek(0.0);

          break;
        }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Text(audioPlayer.uid),
          Row(
            children: <Widget>[
              status,
              Slider(
                max: audioPlayer.duration.toDouble(),
                value: position.toDouble(),
                onChanged: onSeek,
              ),
              Text("${audioPlayer.duration.toDouble()}ms")
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    _playerPositionController.cancel();
    _playerBufferingSubscription.cancel();
    _playerErrorSubscription.cancel();
    audioPlayer.release();
    super.dispose();
  }

  onPlay() {
    audioPlayer.play(widget.url);
  }

  onPause() {
    audioPlayer.pause();
  }

  onSeek(double value) {
    // Note: We can only seek if the audio is ready
    audioPlayer.seek(value);
  }
}

class AudioApp extends StatefulWidget {
  @override
  _AudioAppState createState() => _AudioAppState();
}

class _AudioAppState extends State<AudioApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mental Fitness"),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Yoga And Meditation',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            AudioPlayerDemo(
                "https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/YogaandMeditation.mp3?alt=media&token=60c87128-c7ee-437a-947e-62380256457f"),
            Text(
              'Sleepmusic',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            AudioPlayerDemo(
                "https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/sleepmusic.mp3?alt=media&token=f1df7f49-3888-4ae4-8e0c-04ee8e7d2dec"),
            Text(
              'Meditation',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            AudioPlayerDemo(
                "https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/MeditationMusicRingtone.mp3?alt=media&token=7a6e5d39-93fa-4212-8945-ea09268796cf"),
            Text(
              'Instrumental',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            AudioPlayerDemo(
                "https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Instrumental.mp3?alt=media&token=0ea65004-2199-4fd0-bedb-5578e87f3468"),
            Text(
              'Zen',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            AudioPlayerDemo(
                "https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Musiquezen5minutes256kbpsRingtone.mp3?alt=media&token=c6086771-3c3e-468f-83fe-e5864332a52b"),
          ],
        ),
      ),
    );
  }
}
