import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/video.dart';

class inicio extends StatefulWidget {
  const inicio({Key? key}) : super(key: key);

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  _listarVideos() {
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
   

    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video>? videos = snapshot.data;
                    Video video = videos![index];
                    return Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.imagem)
                              )
                          ),
                          
                        ),
                        ListTile(
                          title: Text(video.titulo  ),
                          subtitle: Text(video.canal),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 10,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data!.length);
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
            
        }
      },
    );
  }
}
