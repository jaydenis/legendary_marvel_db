import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:supabase/supabase.dart';

import '../secrets.dart';
import 'auth_service.dart';
import 'legendary_service.dart';

class Services extends InheritedWidget {
  final AuthService authService;
  final LegendaryService legendaryService;

  Services._({
    required this.authService,
    required this.legendaryService,
    required Widget child,
  }) : super(child: child);

  factory Services({required Widget child}) {
    final client = SupabaseClient(supabaseUrl, supabaseKey);
    final authService = AuthService(client.auth);
    final notesService = LegendaryService(client);
    return Services._(
      authService: authService,
      legendaryService: notesService,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static Services of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Services>()!;
  }
}