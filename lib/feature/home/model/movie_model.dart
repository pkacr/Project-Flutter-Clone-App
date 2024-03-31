class Movie {
  final String title;
  final String assetImage;
  final String type;
  final String duration;
  final String rating;
  final String synopsis;
  final bool isPlaying;

  Movie({
    required this.title,
    required this.assetImage,
    required this.type,
    required this.duration,
    required this.rating,
    required this.synopsis,
    required this.isPlaying,
  });
}

final nowPlayingMovie = [
  Movie(
    title: "Minions: The Rise of Gru",
    assetImage: "assets/minion.jpeg",
    type: "Animation",
    duration: "1h 27m",
    rating: "8.5/10",
    synopsis:
        "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
    isPlaying: true,
  ),
  Movie(
      title: "Spy-x-Family-Code-White",
      assetImage: "assets/spy.jpeg",
      type: "Animation",
      duration: "1h 50m",
      rating: "8.0/10",
      synopsis:
          "After receiving an order to be replaced in Operation Strix, Loid decides to help Anya win a cooking competition at Eden Academy by making the principal's favorite meal in order to prevent his replacement. The Forgers decide to travel to the region where the meal originates, but accidentally set off a chain of events which could put the world's peace at risk.",
      isPlaying: true),
  Movie(
      title: "หลานม่า",
      assetImage: "assets/m.jpeg",
      type: "Drama",
      duration: "2h 5m",
      rating: "9.0/10",
      synopsis:
          "คนที่กลับบ้านไปเมื่อไหร่ก็เจอ อาจไม่ได้อยู่รอเราตรงนั้นตลอดไป..‘หลานม่า’ ภาพยนตร์บันทึกช่วงเวลามีค่าของสิ่งที่เรียกว่าครอบครัว พบกับภาพยนตร์เรื่องล่าสุดจาก GDH นำแสดงโดย บิวกิ้น พุฒิพงศ์ อัสสรัตนกุล, ดู๋ สัญญา คุณากร, เผือก พงศธร จงวิลาส, เจีย สฤญรัตน์ โทมัส, ตู ต้นตะวัน ตันติเวชกุล และขอแนะนำนักแสดงหน้าใหม่ วัย 76 ปี แต๋ว อุษา เสมคำ",
      isPlaying: true),
  Movie(
    title: "Thor: Love and Thunder",
    assetImage: "assets/thor.jpeg",
    type: "Action",
    duration: "1h 59m",
    rating: "7.0/10",
    synopsis:
        "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher's vengeance and stop him before it's too late.",
    isPlaying: true,
  ),
  Movie(
    title: "Bricklayer",
    assetImage: "assets/Bricklayer.jpeg",
    type: "Action",
    duration: "1h 50m",
    rating: "8.0/10",
    synopsis:
        "Someone is blackmailing the CIA - assassinating foreign journalists and making it look like the agency is responsible. As the world begins to unite against the US, the CIA must lure its most brilliant - and rebellious - operative out of retirement, forcing him to confront his checkered past while unraveling an international conspiracy.",
    isPlaying: true,
  ),
  Movie(
      title: "Zone Of Interest",
      assetImage: "assets/zone.jpeg",
      type: "Drama",
      duration: "1h 45m",
      rating: "9.0/10",
      synopsis:
          "The commandant of Auschwitz, Rudolf Höss, and his wife Hedwig, strive to build a dream life for their family in a house and garden next to the camp.",
      isPlaying: true),
  Movie(
      title: "กังฟูแพนด้า 4",
      assetImage: "assets/panda.jpeg",
      type: "Animation",
      duration: "1h 35m",
      rating: "9.5/10",
      synopsis:
          "เรื่องราวของ โป ที่เดินทางออกจากหมู่บ้านสันติไปยังเมืองใหญ่ ที่ซึ่งตัวตนอันชั่วร้ายที่คาดไม่ถึงกำลังเฝ้ารอเขาอยู่ มันก็คือวายร้ายคนใหม่ที่มีชื่อว่า เดอะ คาเมเลี่ยน นั่นเอง โดยคู่ปรับคนใหม่ของนักรบมังกร จะไม่ใช่คนที่เขาต่อสู้แบบเล่น ๆ อย่างแต่ก่อนได้อีกต่อไปแล้ว เพราะว่าความอันตรายของศัตรูคนนี้คือ ความสามารถที่จะเรียกเอาเหล่าศัตรูในอดีตของ โป กลับมาได้",
      isPlaying: true),
  Movie(
      title: "Exhuma",
      assetImage: "assets/Exhuma.jpeg",
      type: "Horror",
      duration: "2h 15m",
      rating: "9.0/10",
      synopsis:
          "After suffering from serial paranormal events, a wealthy family living in LA summons a young rising shaman duo Hwa-rim and Bong-gil to save the newborn of the family. Once they arrive, Hwa-rim senses a dark shadow of their ancestor has latched on the family, so-called a ‘Grave’s Calling’. In order to exhume the grave and relieve the ancestor, ...",
      isPlaying: true),
  Movie(
      title: "No Way Up",
      assetImage: "assets/no.jpeg",
      type: "Horror",
      duration: "1h 30m",
      rating: "8.0/10",
      synopsis:
          "Characters from different backgrounds are thrown together when the plane they're travelling on crashes into the Pacific Ocean. A nightmare fight for survival ensues with the air supply running out and dangers creeping in from all sides.",
      isPlaying: true),
  Movie(
      title: "Bob Marley : One Love",
      assetImage: "assets/Bob.jpeg",
      type: "Music",
      duration: "1h 45m",
      rating: "8.0/10",
      synopsis:
          "Celebrates the life and music of an icon who inspired generations through his message of love and unity. Discover Bob Marley’s powerful story of overcoming adversity and the journey behind his revolutionary music",
      isPlaying: true),
  Movie(
      title: "Kyrie Director's Cut Version",
      assetImage: "assets/kyrie.jpeg",
      type: "Music",
      duration: "3h",
      rating: "8.5/10",
      synopsis:
          "Luca lost her family in the Great East Japan Earthquake causing her not to be able to speak. However, her singing voice shakes the hearts of those who listen to her. It is a hymn of compassion played by Luca and the people.",
      isPlaying: true)
];

final upcoming = [
  Movie(
    title: "DC League of Super-Pets",
    assetImage: "assets/super-pets.jpeg",
    type: "Animation",
    duration: "1h 46m",
    rating: "N/A",
    synopsis:
        "When Superman and the rest of the Justice League are kidnapped, Krypto the Super-Dog must convince a rag-tag shelter pack - Ace the hound, PB the potbellied pig, Merton the turtle and Chip the squirrel - to master their own newfound powers and help him rescue the superheroes.",
    isPlaying: false,
  ),
  Movie(
      title: "Garfield Movie",
      assetImage: "assets/G.jpeg",
      type: "Animation",
      duration: "TBC",
      rating: "N/A",
      synopsis:
          "Animated feature film based on the popular comic strip about a sarcastic, lasagna-loving cat.",
      isPlaying: false),
  Movie(
      title: "SUGA | Agust D TOUR 'D-DAY' THE MOVIE",
      assetImage: "assets/suga.jpeg",
      type: "Music",
      duration: "1h 24m",
      rating: "N/A",
      synopsis:
          "The eagerly awaited film of BTS SUGA’s Encore Concert <SUGA│Agust D TOUR ‘D-DAY’ THE MOVIE> bursts onto the big screen worldwide!",
      isPlaying: false),
  Movie(
    title: "Nope",
    assetImage: "assets/nope.jpeg",
    type: "Science Fiction",
    duration: "2h 11m",
    rating: "N/A",
    synopsis:
        "Residents in a lonely gulch of inland California bear witness to an uncanny, chilling discovery.",
    isPlaying: false,
  ),
  Movie(
    title: "Thirteen Lives",
    assetImage: "assets/lives.jpeg",
    type: "Drama",
    duration: "1h 46m",
    rating: "N/A",
    synopsis:
        "A dramatization of the rescue of a boys soccer team from an underground cave in Thailand.",
    isPlaying: false,
  ),
];
