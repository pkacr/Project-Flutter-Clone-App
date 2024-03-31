import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ui/feature/home/presentation/widget/banner_widget.dart';
import 'package:movie_ui/feature/home/presentation/widget/category_widget.dart';
import 'package:movie_ui/feature/home/presentation/widget/now_playing_movie_widget.dart';
import 'package:movie_ui/feature/home/presentation/widget/section_title_widget.dart';
import 'package:movie_ui/feature/home/presentation/widget/trailers_model.dart';
import 'package:movie_ui/feature/home/presentation/widget/upcoming_movie_widget.dart';
import 'package:movie_ui/feature/login.dart';
import 'package:movie_ui/feature/movie_booking/presentation/myticket.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  bool show = true;

  //sign user in method
  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
    const LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('Home'),
  actions: [
    IconButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      },
      icon: Icon(Icons.logout),
    ),
  ],
),

      body: ListView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Welcome",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Book your favorite Movie here!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: BannerWidget(),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SectionTitleWidget(title: "Category"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: CategoryWidget(),
          ),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SectionTitleWidget(title: "Trailer"),
          ),
          const SizedBox(height: 20.0),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            height: 200,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: TrailersMovie.listTrailers.length,
              itemBuilder: (context, i) =>
                  _ItemTrailers(trailers: TrailersMovie.listTrailers[i]),
            ),
          ),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SectionTitleWidget(title: "Now Playing"),
          ),
          const SizedBox(height: 16),
          const NowPlayingMovieWidget(),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SectionTitleWidget(title: "Upcoming"),
          ),
          const SizedBox(height: 16),
          const UpcomingMovieWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyTicketScreen()),
          );
        },backgroundColor: Colors.white,
        
        child: Icon(Icons.confirmation_number,color: Color(0xFFba903a),)
      ),
    
    );
  }
}

class _ItemTrailers extends StatelessWidget {
  final TrailersMovie trailers;

  const _ItemTrailers({Key? key, required this.trailers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Stack(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(trailers.image))),
          ),
          SizedBox(
            width: 300,
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.white.withOpacity(0.3),
                    child: const Icon(Icons.play_arrow_rounded,
                        color: Color(0xFFE8B448), size: 45)),
              ),
            )),
          )
        ],
      ),
    );
  }
}
