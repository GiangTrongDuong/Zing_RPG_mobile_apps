import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/style_button.dart';
import 'package:flutter_rpg/shared/style_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
    _sloganController.dispose();// TODO: implement dispose
    super.dispose();
  }

  //submit handler
  void handleSubmit(){
    if (_nameController.text.trim().isEmpty) {
      print('name must not be empty');
      return;
    }

    if (_sloganController.text.trim().isEmpty) {
      print('slogan must not be empty');
      return;
    }

    print(_nameController.text);
    print(_sloganController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20,),
        child: SingleChildScrollView(
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
                controller: _nameController,
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
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,),
                  cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.text_format),
                  label: StyledText('Slogan'),
                ),
              ),
              const SizedBox(height: 30,),
          
              //select vocation title
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor,),
              ),
              const Center(
                child: StyledHeading('Choose a vocation!'),
              ),
              const Center(
                child: StyledText('This determined your available skill'),
              ),
              const SizedBox(height: 30,),
              // vocation card
              const VocationCard(
                vocation: Vocation.corporate 
                ),
                const VocationCard(
                vocation: Vocation.cowboy
                ),
                const VocationCard(
                vocation: Vocation.helldiver
                ),
                const VocationCard(
                vocation: Vocation.police
                ),
          
              Center(
                child: StyledButton(
                  onPressed: handleSubmit, 
                  child: const StyledHeading('Create Character'),
                ),
              )
            ],
            ),
        )
      ),
    );
  }
}