import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/style_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20,),
        child: Column(
          children: [
            //Welcome message
            Center(
              child: Icon(Icons.code, color: AppColors.primaryColor,),
            ),
            const Center(
              child: StyledHeading('Welcome, create new player!'),
            ),
            const Center(
              child: StyledText('Create a name and slogan for your character!'),
            ),
            const SizedBox(height: 30,),

            //input for name and slogan
            TextField(
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium,),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_3),
                label: StyledText('Name'),
              ),
              cursorColor: AppColors.textColor,
            ),
            const SizedBox(height: 20,),
            TextField(
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium,),
                cursorColor: AppColors.textColor,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.text_format),
                label: StyledText('Slogan'),
              ),
            ),
            const SizedBox(),

          ],
          )
      ),
    );
  }
}