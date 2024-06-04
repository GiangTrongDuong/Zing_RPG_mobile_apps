import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/shared/style_button.dart';
import 'package:flutter_rpg/shared/style_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose(); // TODO: implement dispose
    super.dispose();
  }

  // handling vocation selection
  Vocation selectedVocation = Vocation.corporate;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  //submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      //show error dialog

      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading('Missing Character Name'),
              content: const StyledText(
                  'Every good RPG character needs a great name...'),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const StyledHeading('close'))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }

    if (_sloganController.text.trim().isEmpty) {
      //show error dialog

      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading('Missing Slogan'),
              content: const StyledText(
                  'Every good RPG character needs a slogan...'),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const StyledHeading('close'))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }
    characters.add(Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        id: uuid.v4(),
        vocation: selectedVocation));

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Welcome message
                Center(
                  child: Icon(
                    Icons.code,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Center(
                  child: StyledHeading('Welcome, create new player!'),
                ),
                const Center(
                  child: StyledText(
                      'Create a name and slogan for your character!'),
                ),
                const SizedBox(
                  height: 30,
                ),

                //input for name and slogan
                TextField(
                  controller: _nameController,
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_3),
                    label: StyledText('Name'),
                  ),
                  cursorColor: AppColors.textColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _sloganController,
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  cursorColor: AppColors.textColor,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.text_format),
                    label: StyledText('Slogan'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //select vocation title
                Center(
                  child: Icon(
                    Icons.code,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Center(
                  child: StyledHeading('Choose a vocation!'),
                ),
                const Center(
                  child: StyledText('This determined your available skill'),
                ),
                const SizedBox(
                  height: 30,
                ),
                // vocation card
                VocationCard(
                    selected: selectedVocation == Vocation.corporate,
                    onTap: updateVocation,
                    vocation: Vocation.corporate),
                VocationCard(
                    selected: selectedVocation == Vocation.cowboy,
                    onTap: updateVocation,
                    vocation: Vocation.cowboy),
                VocationCard(
                    selected: selectedVocation == Vocation.helldiver,
                    onTap: updateVocation,
                    vocation: Vocation.helldiver),
                VocationCard(
                    selected: selectedVocation == Vocation.police,
                    onTap: updateVocation,
                    vocation: Vocation.police),
                //Good luck message
                Center(
                  child: Icon(
                    Icons.code,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Center(
                  child: StyledHeading('Good luck traveling!'),
                ),
                const Center(
                  child: StyledText('May Thy Journey Shilling!'),
                ),
                const SizedBox(
                  height: 30,
                ),

                Center(
                  child: StyledButton(
                    onPressed: handleSubmit,
                    child: const StyledHeading('Create Character'),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
