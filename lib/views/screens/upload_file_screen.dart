import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/providers/timetable_provider.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';
import 'package:timetable/views/widgets/custom_button.dart';

class UploadFileScreen extends StatefulWidget {
  @override
  _UploadFileScreenState createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
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
          child: Column(
            children: [
              CustomAppBar(title: 'Upload TimeTable', isBackButton: true),
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
                      }),
                ),
              ),
             CustomButton(title: 'Upload', onTap: () {
               //TODO : implement file upload
               Provider.of<TimeTableProvider>(context, listen: false).uploadTT(
                   _collegeName, _branchName, _stdName, _divName, 'filePath');
               Navigator.pop(context);
             })
            ],
          ),
        ),
      ),
    );
  }
}
