import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:moradas/constants.dart';
import 'package:moradas/models/notice_model.dart';
import 'package:provider/provider.dart';

import '../controller/notice_controller.dart';

class CreateNoticePage extends StatefulWidget {
  const CreateNoticePage({super.key});

  @override
  State<CreateNoticePage> createState() => _CreateNoticePageState();
}

class _CreateNoticePageState extends State<CreateNoticePage> {
  Notice notice = new Notice();

  TextEditingController _controllerDateStart = TextEditingController();
  TextEditingController _controllerDateEnd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final noticeController = context.watch<NoticeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Avisos'),
        backgroundColor: Color(colorBlueSimple),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    TextFormField(
                      controller: null,
                      maxLength: 30,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Título do Aviso.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.description,
                          )),
                      onChanged: (text) {
                        notice.title = text;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    TextFormField(
                      controller: null,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Descrição do Aviso.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.article,
                          )),
                      onChanged: (text) {
                        notice.noticedescription = text;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    TextFormField(
                      controller: _controllerDateStart,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Data Inicio do aviso.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.today,
                          )),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)));
                        if (pickeddate != null) {
                          setState(() {
                            _controllerDateStart.text =
                                UtilData.obterDataDDMMAAAA(pickeddate);
                            notice.startdate = pickeddate.year.toString() +
                                '-' +
                                pickeddate.month.toString() +
                                '-' +
                                pickeddate.day.toString();
                          });
                        } else {
                          _controllerDateStart.text =
                              UtilData.obterDataDDMMAAAA(DateTime.now());
                          notice.startdate = DateTime.now().year.toString() +
                              '-' +
                              DateTime.now().month.toString() +
                              '-' +
                              DateTime.now().day.toString();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    TextFormField(
                      controller: _controllerDateEnd,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Data Fim do aviso.',
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.event,
                          )),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)));
                        if (pickeddate != null) {
                          setState(() {
                            _controllerDateEnd.text =
                                UtilData.obterDataDDMMAAAA(pickeddate);
                            notice.enddate = pickeddate.year.toString() +
                                '-' +
                                pickeddate.month.toString() +
                                '-' +
                                pickeddate.day.toString();
                          });
                        } else {
                          _controllerDateEnd.text =
                              UtilData.obterDataDDMMAAAA(DateTime.now());
                          notice.enddate = DateTime.now().year.toString() +
                              '-' +
                              DateTime.now().month.toString() +
                              '-' +
                              DateTime.now().day.toString();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(15),
            //   child: SizedBox(
            //     child: Flex(
            //       direction: Axis.vertical,
            //       children: [
            //         TextFormField(
            //           controller: null,
            //           decoration: const InputDecoration(
            //               border: OutlineInputBorder(),
            //               labelText: 'Escolha um Ícone.',
            //               fillColor: Colors.white,
            //               filled: true,
            //               suffixIcon: Icon(
            //                 Icons.add_reaction,
            //               )),
            //           onEditingComplete: () {},
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 24),
                shape: StadiumBorder(),
                backgroundColor: Colors.amber,
              ),
              child: Text('Criar Aviso'),
              onPressed: () {
                noticeController.addNewNotice(notice);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
