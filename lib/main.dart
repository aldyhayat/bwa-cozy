// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:bootcamp_buildangga/models/space.dart';
import 'package:bootcamp_buildangga/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/splash.dart';
import 'color.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BwaCozy',
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: SplashPage(),
      ),
     
    );
  }
}