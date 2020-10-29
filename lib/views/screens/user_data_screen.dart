import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/services/local_db.dart';
import 'package:timetable/views/bottomNavBar/bottom_nav_bar.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';
import 'package:timetable/views/widgets/custom_button.dart';

class UserDataScreen extends StatefulWidget {
  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  String _collegeName;
  List _listOfColleges = ['sitrc', 'siem', 'sip', 'su'];

  String _branchName;
  List _listOfBranch = ['comp', 'it', 'mech', 'e&tc', 'electrical', 'civil'];

  String _stdName;
  List _listOfStd = ['fe', 'se', 'te', 'be'];

  String _divName;
  List _listOfDiv = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: 'Provide Data', isBackButton: false),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 24),
                child: SvgPicture.asset(
                  'assets/undraw_forms_78yw.svg',
                  height: 200,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Please Provide Following Data.',
                  style: GoogleFonts.mukta(fontSize: 22, color: primary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: primary, width: 2)),
                  child: DropdownButton(
                      dropdownColor: darkBackground,
                      underline: SizedBox(),
                      elevation: 5,
                      value: _collegeName,
                      isExpanded: true,
                      icon: Icon(
                        FontAwesome.angle_down,
                        color: primary,
                      ),
                      hint: Text('select college'.toUpperCase(),
                          style: GoogleFonts.mukta(color: textColor)),
                      items: _listOfColleges.map((value) {
                        return DropdownMenuItem(
                          child: Text(
                            value.toString().toUpperCase(),
                            style: GoogleFonts.mukta(color: textColor),
                          ),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) async {
                        setState(() {
                          _collegeName = value;
                        });
                        LocaleDB.saveUserCollege(value);
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: primary, width: 2)),
                  child: DropdownButton(
                      dropdownColor: darkBackground,
                      underline: SizedBox(),
                      elevation: 5,
                      value: _branchName,
                      isExpanded: true,
                      icon: Icon(
                        FontAwesome.angle_down,
                        color: primary,
                      ),
                      hint: Text('select branch'.toUpperCase(),
                          style: GoogleFonts.mukta(color: textColor)),
                      items: _listOfBranch.map((value) {
                        return DropdownMenuItem(
                          child: Text(
                            value.toString().toUpperCase(),
                            style: GoogleFonts.mukta(color: textColor),
                          ),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) async {
                        setState(() {
                          _branchName = value;
                        });
                        LocaleDB.saveUserBranch(value);
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: primary, width: 2)),
                  child: DropdownButton(
                      dropdownColor: darkBackground,
                      underline: SizedBox(),
                      elevation: 5,
                      value: _stdName,
                      isExpanded: true,
                      icon: Icon(
                        FontAwesome.angle_down,
                        color: primary,
                      ),
                      hint: Text('select class'.toUpperCase(),
                          style: GoogleFonts.mukta(color: textColor)),
                      items: _listOfStd.map((value) {
                        return DropdownMenuItem(
                          child: Text(
                            value.toString().toUpperCase(),
                            style: GoogleFonts.mukta(color: textColor),
                          ),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) async {
                        setState(() {
                          _stdName = value;
                        });
                        LocaleDB.saveUserStd(value);
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: primary, width: 2)),
                  child: DropdownButton(
                      dropdownColor: darkBackground,
                      underline: SizedBox(),
                      elevation: 5,
                      value: _divName,
                      isExpanded: true,
                      icon: Icon(
                        FontAwesome.angle_down,
                        color: primary,
                      ),
                      hint: Text('select division'.toUpperCase(),
                          style: GoogleFonts.mukta(color: textColor)),
                      items: _listOfDiv.map((value) {
                        return DropdownMenuItem(
                          child: Text(
                            value.toString().toUpperCase(),
                            style: GoogleFonts.mukta(color: textColor),
                          ),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) async {
                        setState(() {
                          _divName = value;
                        });
                        LocaleDB.saveUserDiv(value);
                      }),
                ),
              ),
              Center(
                child: CustomButton(
                    title: 'Done',
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return BottomNavBar();
                      }));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
