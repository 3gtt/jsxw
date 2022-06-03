import 'package:flutter/material.dart';

class LoadingMoreWidget extends StatelessWidget {
  const LoadingMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 10),
          child: const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
        const Text("加载更多...", style: TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}