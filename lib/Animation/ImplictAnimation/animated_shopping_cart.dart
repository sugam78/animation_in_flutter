import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpanded = false;

  void changeOnTap(){
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: changeOnTap,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: isExpanded?150:80,
            height: 60.0,
            decoration: BoxDecoration(
              color: isExpanded?Colors.green:Colors.blue,
              borderRadius: BorderRadius.circular(isExpanded?50:10),
            ),
            child:  Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  isExpanded?Icons.check:
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                if(isExpanded) Text("Added to Cart"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}