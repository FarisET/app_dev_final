import 'package:app_dev_final/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TransactionCard extends StatefulWidget {
  final Products user;
  const  TransactionCard({super.key, required this.user});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 1,
  //    color: Colors.lightBlue[100],
      child: ListTile(
        leading: SizedBox(
          width: MediaQuery.of(context).size.width * 0.1, // Adjust as needed
          height: MediaQuery.of(context).size.width * 0.1, // Adjust as needed
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.03),
            child: CachedNetworkImage(
              width: MediaQuery.sizeOf(context).width*.055,
              height: MediaQuery.sizeOf(context).height*.055,
              imageUrl: '${widget.user.thumbnail}',
              errorWidget: (context, url, error) => const CircleAvatar(
                child: Icon(CupertinoIcons.airplane),
            ),
            
            ),
          ),
        ),
        title:  Text(widget.user.title),
        subtitle:  Text(
          widget.user.date.toString(),
          maxLines: 1,
        ),
        trailing: Text('${widget.user.credit}')
      ),
    );
  }
}

//Text(
        //   "${DateTime.now().hour}:${DateTime.now().minute}",
        //   style: const TextStyle(color: Colors.black45),
        // ),