import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../../models/document_model.dart';

class TitleCardDocumentWidget extends StatelessWidget {
  final IconData leftIcon;
  final Color iconColor;
  Document document = Document();

  TitleCardDocumentWidget(
      {super.key,
      this.leftIcon = Icons.description,
      this.iconColor = const Color(colorBlueSimple),
      required this.document});

  Future<void> launchInBrowser(String nameFile) async {
    Uri url = Uri.parse("$APIdoc" 'files/' "$nameFile");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: ListTile(
        leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(leftIcon, color: iconColor, size: 30)]),
        title: Text(document.title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              document.description!,
              style:
                  const TextStyle(fontSize: 18, color: Color(colorBlueSimple)),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_forward_ios,
              size: 30,
            ),
          ],
        ),
        onTap: () => {launchInBrowser(document.nameFile!)},
      ),
    );
  }
}
