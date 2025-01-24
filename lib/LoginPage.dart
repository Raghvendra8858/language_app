import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:language_app/languageprovider.dart';
import 'package:language_app/main.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signup),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          DropdownMenu(
            textStyle: TextStyle(color: Colors.white),
            initialSelection: context.watch<languageprovider>().selectedLocale.languageCode,
            onSelected: (value) {
              context.read<languageprovider>().changelanguage(value as String);
            },
            dropdownMenuEntries: languageprovider.language.map((language) =>
                DropdownMenuEntry(
                  value: language['locale'], // Corrected from 'loacal' to 'locale'
                  label: language['name'],
                )
            ).toList(),
          ),
        ],

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Text(
                AppLocalizations.of(context)!.hotstar,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),

              // Email/Phone Number Field
              TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  labelText: AppLocalizations.of(context)!.emailorphone,
                  labelStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Password Field
              TextFormField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  labelText: AppLocalizations.of(context)!.password,
                  labelStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppLocalizations.of(context)!.forgotpassword,
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              SizedBox(height: 20),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Login logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30),

              // Sign Up Link
              Text(
                AppLocalizations.of(context)!.dontaccount,
                style: TextStyle(color: Colors.white54),
              ),
              Text(
                AppLocalizations.of(context)!.signup,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(AppLocalizations.of(context)!.google, Colors.red),
                  SizedBox(width: 10),
                  _buildSocialButton(AppLocalizations.of(context)!.facebook, Colors.blue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.ac_unit, color: Colors.white), // Replace with actual icons
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

