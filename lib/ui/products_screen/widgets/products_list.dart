import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../dto/products.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key, required this.itemList}) : super(key: key);
  final List<Products> itemList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemList.length,

        itemBuilder: (BuildContext context, int index) {
          return Card(
            child:  Padding(
              padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(itemList[index].image!),
                    radius: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(itemList[index].title! , overflow: TextOverflow.ellipsis,softWrap: true,),
                        Text(itemList[index].title! , overflow: TextOverflow.ellipsis,softWrap: true,),
                      ],
                    ),
                  )
                ],
              ),
            ) ,
          );
        },
      ),
    );
  }
}
