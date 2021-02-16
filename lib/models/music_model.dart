class MusicModel {
  final int id;
  final String title;
  final String album;
  final String lyric;
  final String songPath;
  final double duration;

  MusicModel({this.id,this.title,this.lyric,this.album, this.duration, this.songPath});

  static List<MusicModel> list = [
    MusicModel(
        id: 1,
        title: "Welcome Home",
        album: "GMS Live",
        duration: 60,
        songPath: "1welcomehome.mp3",
        lyric:"Kurasa sepi di hati\nBagi kabut di langit yang biru\nYang kuperlukan seorang sahabat\nMengisi hampa dalam jiwaku\n\nTerasa dingin di hati\nKu bertanya kemanakah kasih\nYang kuperlukan cinta sejati\nMenerbitkan pelangi di hati\n\nKudengar welcome home\nBersorak batinku\nSkarang kutahu ku berharga\nEngkau besertaku\nMemanggil namaku\nI'm home with You\nBersamaMu Yesus Sahabatku\nTerasa dingin di hati\nKu bertanya kemanakah kasih\nYang kuperlukan cinta sejati\nMenerbitkan pelangi di hati\n\nKudengar welcome home\nBersorak batinku\nSkarang kutahu ku berharga\nEngkau besertaku\nMemanggil namaku\nI'm home with You\nBersamaMu Yesus Sahabatku\n\nKudengar welcome home\nBersorak batinku\n\nKudengar welcome home\nBersorak batinku\nSkarang kutahu ku berharga\nEngkau besertaku\nMemanggil namaku\nI'm home with You\nBersamaMu Yesus Sahabatku\n\nBersamaMu Yesus Sahabatku\nBersamaMu Yesus Sahabatku"),
    MusicModel(
        id: 2,
        title: "Tertawa",
        album: "GMS Live",
        duration: 60,
        songPath: "2tertawa.mp3",
        lyric:"KaryaMu mempesonaku\nKau angkatku dari kelamnKasih tulus memberi warna\n\nKau buang semua gelisah\nKau beriku sukacita\nKau buatku selalu tertawa\n\nKau taruh lagu baru dalam hatiku\nMulutku bersorak memuji namaMu\n\nDari hatiku mengalir\nPujian bagiMu, oh sukacita\nRohMu hadir di sini\n\nDan 'ku menari, memuji\nDi hadapanMu, Yesus, sukacita\nRohMu hadir di sini\n\nKaryaMu mempesonaku\nKau angkatku dari kelam\nKasih tulus memberi warna\n\nKau buang semua gelisah\nKau beriku sukacita\nKau buatku selalu tertawa\n\nKau taruh lagu baru dalam hatiku\nMulutku bersorak memuji namaMu\n\nDari hatiku mengalir\nPujian bagiMu, oh sukacita\nRohMu hadir di sini…"),
    MusicModel(
        id: 3,
        title: "Rhythm My Soul",
        album: "GMS Live",
        duration: 60,
        songPath: "3rhythmofmysoul.mp3",
        lyric:"It is You\nThe Savior of my soul\nThe Lifter of my head\n\nOnly You\nThe One who breaks my chains\nAnd wipes away my sins\n\nWith You\nI feel so secure\nCause You are my Redeemer\n\nIn You\nI find my peace\nAnd I'll give You all my praise\n\nOn the thought of who You are\nMake melodies in me\nSongs of joy and victory are written in this place\n\nI tune my heart to sing\nI move my feet to dance\nIn the rhythm of praise\n\nJesus, the rhythm of my soul\nJesus, the rhythm of my soul"),
    MusicModel(
        id: 4,
        title: "Pilihanku",
        album: "GMS Live",
        duration: 60,
        songPath: "4pilihanku.mp3",
        lyric:"Kau Tuhan yang mulia turun ke dunia\n'Tuk tebus segala dosa\nKau beri keselamatan, beri kesempatan\nKasih-Mu mengubahkan\n\nTak mau ku hidup bagi dunia ini lagi\nTak ingin kompromi\nTak ingin lakukan hal yang dapat dukakan hati-Mu\nTak mau ku hidup di luar tutur kata firman-Mu yang telah bebaskanku\nYesus, kebenaran-Mu adalah, adalah pilihanku\n\nKau Tuhan yang mulia turun ke dunia\n'Tuk tebus segala dosa\nKau beri keselamatan, beri kesempatan\nKasih-Mu mengubahkan\n\nJika kuakui semua dosaku\nMaka Kau adalah setia dan adil\nKau 'kan mengampuni dan sucikan\nDari segala yang jahat\n\nTak mau 'ku hidup bagi dunia ini lagi\nTak ingin kompromi\nTak ingin lakukan hal yang dapat dukakan hati-Mu\nTak mau ku hidup di luar tutur kata firman-Mu yang telah bebaskanku\nYesus, kebenaran-Mu adalah, adalah pilihanku\n\nTak mau ku hidup bagi dunia ini lagi\nTak ingin kompromi\nTak ingin lakukan hal yang dapat dukakan hati-Mu\nTak mau ku hidup di luar tutur kata firman-Mu yang telah bebaskan ku\nYesus, kebenaran-Mu adalah\nAdalah...Pilihanku\n\nTak mau ku hidup di luar tutur kata firman-Mu yang telah bebaskanku\nYesus, kebenaran-Mu adalah, adalah pilihanku"),
    MusicModel(
        id: 5,
        title: "Jesus I Love You",
        album: "GMS Live",
        duration: 60,
        songPath: "5jesusiloveyou.mp3",
        lyric:""),
    MusicModel(
        id: 6,
        title: "Mengapi-Apikan Diri",
        album: "GMS Live",
        duration: 60,
        songPath: "6mengapiapikandiri.mp3",
        lyric:""),
    MusicModel(
        id: 7,
        title: "Holy Spirit My Best Friend",
        album: "GMS Live",
        duration: 60,
        songPath: "7holyspiritmybestfriend.mp3",
        lyric:""),
    MusicModel(
        id: 8,
        title: "Menuai Tanpa Batas",
        album: "GMS Live",
        duration: 60,
        songPath: "8menuaitanpabatas.mp3",
        lyric:""),
    MusicModel(
        id: 9,
        title: "Seribu Rasa",
        album: "GMS Live",
        duration: 60,
        songPath: "9seriburasa.mp3",
        lyric:""),
    MusicModel(
        id: 10,
        title: "Pulang",
        album: "GMS Live",
        duration: 60,
        songPath: "10pulang.mp3",
        lyric:""),
    MusicModel(
        id: 11,
        title: "Setia Dan Benar",
        album: "GMS Live",
        duration: 60,
        songPath: "11setiadanbenar.mp3",
        lyric:""),
    MusicModel(
        id: 12,
        title: "Segalanya",
        album: "GMS Live",
        duration: 60,
        songPath: "12segalanya.mp3",
        lyric:""),
    MusicModel(
        id: 13,
        title: "Sorak Kemenangan",
        album: "GMS Live",
        duration: 60,
        songPath: "13sorakkemenangan.mp3",
        lyric:""),
  ];
}
