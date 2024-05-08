import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  int? selectedBlock;
  final List<int> blockNumbers = List.generate(56, (index) => index + 1);
  final Map<int, List<Map<String, String>>> blockAuthorities = {
    // Add block numbers and corresponding authorities here
    1: [
      {'title': 'HOS- ABC', 'contact': '1234567890'},
      {'title': 'HOD-ABC', 'contact': '1234567890'},
      {'title': 'Counsellor-ABC', 'contact': '1234567890'},
      {'title': 'Security Guard-ABC', 'contact': '1234567890'},
      // Add other authorities for block 1
    ],
    // Continue adding for other blocks...
    38: [
      // Specific authorities for block 38
      {'title': 'HOS', 'name': 'Pawan', 'contact': '1234567890'},
      {'title': 'HOD', 'name': 'Pawan', 'contact': '1234567890'},
      {'title': 'Counsellor', 'name': 'Pawan', 'contact': '1234567890'},
      {'title': 'Security Guard', 'name': 'Pawan', 'contact': '1234567890'},
      // Add other authorities for block 38
    ],
    // ... up to block 56
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Block'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            _buildDropdown(),
            Expanded(
              child: ListView(
                children: selectedBlock != null
                    ? _buildAuthorityList(selectedBlock!)
                    : [Center(child: Text('Please select a block'))],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepPurple, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          hint: Text("Choose a Block"),
          value: selectedBlock,
          isExpanded: true,
          iconSize: 30,
          icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
          items: blockNumbers.map((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: (int? newValue) {
            setState(() {
              selectedBlock = newValue;
            });
          },
        ),
      ),
    );
  }

  List<Widget> _buildAuthorityList(int blockNumber) {
    List<Map<String, String>>? authorities = blockAuthorities[blockNumber];
    if (authorities == null) {
      return [Text('No authorities listed for this block.')];
    }

    return authorities.map((authority) {
      return Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: ListTile(
          leading: Icon(Icons.person, color: Colors.deepPurple),
          title: Text(authority['title']!,
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Contact: ${authority['contact']}'),
          trailing: IconButton(
            icon: Icon(Icons.phone, color: Colors.green),
            onPressed: () => _makePhoneCall(authority['contact']!),
          ),
        ),
      );
    }).toList();
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      await launchUrl(launchUri);
    } catch (e) {
      throw 'Could not launch $launchUri';
    }
  }
}
