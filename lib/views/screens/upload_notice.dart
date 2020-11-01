import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:timetable/constants.dart';
import 'package:timetable/providers/notice_provider.dart';
import 'package:timetable/views/widgets/custom_app_bar.dart';
import 'package:timetable/views/widgets/custom_button.dart';

class UploadNotice extends StatefulWidget {
  @override
  _UploadNoticeState createState() => _UploadNoticeState();
}

class _UploadNoticeState extends State<UploadNotice> {
  String _noticeTitle;
  String _noticeDesc;
  String _date;

  String _collegeName;
  List _listOfColleges = ['sitrc', 'siem', 'sip', 'su'];

  String _branchName;
  List _listOfBranch = ['comp', 'it', 'mech', 'e&tc', 'electrical', 'civil'];

  String _stdName;
  List _listOfStd = ['fe', 'se', 'te', 'be'];

  String _divName;
  List _listOfDiv = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];

  File _file;
  String _pdfName = 'Select PDF file';

  Future getFile() async {
    File file = await FilePicker.getFile();
    String filename = basename(file.path);
    setState(() {
      _file = file;
      _pdfName = filename;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: 'Upload NOtice', isBackButton: true),
              Text(
                'Please provide following Info.',
                style: GoogleFonts.mukta(color: textColor, fontSize: 18),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Form(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: GoogleFonts.poppins(color: Colors.white),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(),
                          ),
                          labelText: 'Notice Title',
                          labelStyle: GoogleFonts.poppins(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Title';
                          } else if (value.length > 40) {
                            return 'Please Enter short title';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (text) {
                          setState(() {
                            _noticeTitle = text;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: GoogleFonts.poppins(color: Colors.white),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(),
                          ),
                          labelText: 'Notice Description',
                          labelStyle: GoogleFonts.poppins(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            _noticeDesc = text;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: GoogleFonts.poppins(color: Colors.white),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(),
                          ),
                          labelText: 'Notice Date',
                          labelStyle: GoogleFonts.poppins(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Date';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (text) {
                          setState(() {
                            _date = text;
                          });
                        },
                      ),
                      CustomButton(
                          title: _pdfName,
                          onTap: () {
                            getFile();
                          }),
                      CustomButton(
                        title: 'Post Notice',
                        onTap: () async {
                          await Provider.of<NoticeProvider>(context,
                                  listen: false)
                              .uploadNotice(
                                  _collegeName,
                                  _branchName,
                                  _stdName,
                                  _divName,
                                  _file.path,
                                  _noticeTitle,
                                  _noticeDesc,
                                  _date);
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
