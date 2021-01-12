import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  ContactDetail(this.data);

  final data;

  @override
  Widget build(BuildContext context) {
    var firstName = data['name']['first'];
    var lastName = data['name']['last'];
    var fullName = '$firstName $lastName';

    return Scaffold(
      appBar: AppBar(
        title: Text("$firstName's information"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 15.0, top: 5.0),
          child: Card(
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.only(top: 12.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            data['picture']['large'],
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(75.0),
                        ),
                        border: Border.all(color: Colors.red[200], width: 4.0),
                      ),
                    ),
                    ListTile(
                      leading: Text(fullName),
                    ),
                    ListTile(
                      leading: Text(data['email']),
                    ),
                    ListTile(
                      leading: Text(data['phone']),
                    ),
                    ListTile(
                      leading: Text(data['cell']),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          onPressed: () => {},
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          color: Colors.green[800],
                        ),
                        RaisedButton(
                          onPressed: () => {},
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          color: Colors.red[800],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
