import 'package:flutter/material.dart';

class SwitchAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Switch Accounts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        height: 500,
        color: Color(0xFFC5CAE9),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index < 5) {
                      return AccountImagePlaceholder(index);
                    } else {
                      return AddAccountButton();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountImagePlaceholder extends StatelessWidget {
  final int index;

  AccountImagePlaceholder(this.index);

  @override
  Widget build(BuildContext context) {
    // Image network ginamit
    String imageUrl = 'https://example.com/image_$index.png';

    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Name $index',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}

class AddAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Colors.black,
            size: 50,
          ),
          SizedBox(height: 8),
          Text(
            'Add Account',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
