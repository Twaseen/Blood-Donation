import 'package:flutter/material.dart';

class BloodBanksPage extends StatelessWidget {
  const BloodBanksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Banks',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemCount: bloodBanks.length,
              itemBuilder: (context, index) {
                final bloodBank = bloodBanks[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.lightBlueAccent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Handle tap event here
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.local_hospital,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        bloodBank.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        'Address: ${bloodBank.address}\nPhone: ${bloodBank.phone}',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 80), // Additional space at the bottom
          ],
        ),
      ),
    );
  }
}

class BloodBank {
  final String name;
  final String address;
  final String phone;

  BloodBank({required this.name, required this.address, required this.phone});
}

final List<BloodBank> bloodBanks = [
  BloodBank(
    name: 'Shadhin Blood Bank & Transfusion Center',
    address: '14/2 Nawab Katra Nimtoli Ln, Dhaka',
    phone: '01711-123478',
  ),
  BloodBank(
    name: 'Bondhon Blood bank & Transfusion Center',
    address: 'Medical moor, 19 Bakshi Bazar Road, Dhaka 1211',
    phone: '01828-669094',
  ),
  BloodBank(
    name: 'Bangladesh Blood Bank and Transfusion Center',
    address: '12, 22 Babar Rd, Dhaka',
    phone: '01850-077185 ',
  ),
  BloodBank(
    name: 'Red Crescent Blood Center',
    address: '7, 5 Aurangajeb Rd, Dhaka',
    phone: ' 01811-458537',
  ),
  BloodBank(
    name: 'Dhaka Blood Bank & Transfusion Center',
    address: 'Green Rd, Dhaka 1205',
    phone: '01681-828322',
  ),
  BloodBank(
    name: 'MUKTI BLOOD BANK',
    address: '54 (1st Floor), Bir-uttuam A.M. Shafiullah Road, Free School St, Dhaka 1205',
    phone: '01764-971811',
  ),
  BloodBank(
    name: '  Quantum Blood Lab',
    address: '31/V Shilpacharya Zainul Abedin Sarak, Shantinagar, 1217',
    phone: '01714-010869',
  ),
  BloodBank(
    name: 'Red Crescent Blood Bank BDRCS',
    address: 'PCW3+HGP, Dhaka 1205',
    phone: ' 01811-458536',
  ),
  BloodBank(
    name: '  Ideal Blood Bank',
    address: '53 Naya Paltan, Dhaka',
    phone: '01988-877800',
  ),
  BloodBank(
    name: '  Quantum Blood Lab',
    address: '31/V Shilpacharya Zainul Abedin Sarak, Shantinagar, 1217',
    phone: '01714-010869',
  ),
];
