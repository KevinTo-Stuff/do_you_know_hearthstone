class Settings {
  bool darkMode;
  bool mute;
  GameSettings gameSettings;

  Settings() : darkMode = false, mute = false, gameSettings = GameSettings();
}

class GameSettings {
  String difficulty;
  bool timed;
  int timer;

  GameSettings() : difficulty = 'normal', timed = false, timer = 0;
}
