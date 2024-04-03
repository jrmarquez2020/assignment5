import 'package:flutter/material.dart';
import 'package:marquez_assignment5/providers/song_provider.dart';
import 'package:provider/provider.dart';
import 'package:marquez_assignment5/screens/song_player_screen.dart';

class SongListScreen extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      "title": "TAKE ALL THE LOVE",
      "path": "assets/musics/Arthur Nery TAKE ALL THE LOVE.mp3",
      "image": "assets/images/take_all_the_love.jpg",
      "artist": "Arthur Nery",
    },
    {
      "title": "Para Sa Akin",
      "path": "assets/musics/Jason Dhakal  Para Sa Akin.mp3",
      "image": "assets/images/para_sa_akin.jpg",
      "artist": "Jason Dhakal",
    },
    {
      "title": "LET EM GO",
      "path": "assets/musics/Matt Hansen  LET EM GO.mp3",
      "image": "assets/images/let_em_go.jpg",
      "artist": "Matt Hansen",
    },
    {
      "title": "Greedy",
      "path": "assets/musics/Tate McRae  greedy.mp3",
      "image": "assets/images/greedy.jpg",
      "artist": "Tate McRae",
    },
    {
      "title": "Gusto ft Al James",
      "path": "assets/musics/Zack Tabudlo Gusto ft Al James.mp3",
      "image": "assets/images/gusto.jpg",
      "artist": "Zack Tabudlo ft Al James",
    },
     {
      "title": "Marikit sa Dilim",
      "path": "assets/musics/Juan and Kyle  Marikit sa Dilim feat JAWZ.mp3",
      "image": "assets/images/marikit.jpg",
      "artist": "Juan and Kyle  ft JAWZ",
    },
    {
      "title": "Golden Hour SB19",
      "path": "assets/musics/JVKE  golden hour SB19 Remix.mp3",
      "image": "assets/images/golden_hour.jpg",
      "artist": "JVKE ft SB19",
    },
    {
      "title": "Heres Your Perfect",
      "path": "assets/musics/Jamie Miller  Heres Your Perfect.mp3",
      "image": "assets/images/here_your_perfect.png",
      "artist": "Jamie Miller",
    },
    {
      "title": "Imagination",
      "path": "assets/musics/Shawn Mendes  Imagination.mp3",
      "image": "assets/images/imagination.jpg",
      "artist": "Shawn Mendes",
    },
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            leading: Image.asset(
              song["image"]!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(song["title"]!),
            subtitle: Text(song["artist"]!), 
            onTap: () {
              final songProvider = Provider.of<SongProvider>(context, listen: false);
              songProvider.play(song["path"]!);
              Navigator.push(
                context,  
                MaterialPageRoute(
                  builder: (context) => SongPlayerScreen(
                    songTitle: song["title"]!,
                    songImage: song["image"]!, songPath: song["path"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}