import 'package:flutter/material.dart';
import 'package:movie_ui/core/route/app_route_name.dart';
import 'package:movie_ui/feature/home/home_screen.dart';
import 'package:movie_ui/feature/movie_booking/presentation/booking_screen.dart';
import 'package:movie_ui/feature/movie_booking/presentation/movie_booking_screen.dart';
import 'package:movie_ui/feature/movie_detail/presentation/movie_detail_screen.dart';
import 'package:movie_ui/feature/movie_detail/upcoming_datail.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.home:
        return MaterialPageRoute(
          builder: (_) =>  HomeScreen(),
          settings: settings,
        );

      case AppRouteName.movieDetail:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const MovieDetailScreen(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      
      case AppRouteName.detailScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailScreen(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.movieBooking:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const MovieBookingScreen(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
        case AppRouteName.bookingScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => BookingScreen(selectedSeat: [], selectedDate: DateTime.now(), selectedTime: null, movieTitle: '',),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
    }
    return null;
  }
}
