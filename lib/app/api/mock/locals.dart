import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/models.dart';
import 'events.dart';

final List<Local> locals = [
  Local(
    id: "0",
    name: 'psy beach club',
    phone: "27 99443287",
    email: "contato@psybeachclub.com.br",
    address: "Avenida Beira-mar da Praia, 46 - Vitoria",
    followers: ['1', "2", "3"],
    type: ['barzinhos'],
    position: LatLng(-25.4258076, -49.2845635),
    events: [
      events[0],
      events[1],
    ],
    profilePicture: 'https://blogjatefalei.files.wordpress.com/2014/11/na-balada.png',
  ),
  Local(
    id: "1",
    name: 'Alcatraz guarapari',
    phone: "27 99443287",
    email: "contato@alcatraz.com.br",
    address: "Avenida das Ondas grandes, 231 - Guarapari",
    followers: ['1', "2", "3"],
    position: LatLng(-25.4258076, -49.2980000),
    type: ['baladas'],
    events: [],
    profilePicture:
        'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Local(
    id: "2",
    name: 'Multi-place Mais',
    phone: "27 92243287",
    email: "contato@multiplacemais.com.br",
    address: "Rua Onda, 31 - Guarapari",
    followers: ['1', "2", "3"],
    position: LatLng(-25.4458076, -49.2715635),
    type: ['barzinhos', 'baladas'],
    events: [],
    profilePicture:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  Local(
    id: "3",
    name: 'Caffè Della Music vitoria',
    phone: "27 99943287",
    email: "contato@caffe.com.br",
    address: "Av. Praia Grande, 346 - Vitoria",
    followers: ["2", "3"],
    position: LatLng(-25.4358076, -49.2815635),
    type: ['barzinhos', 'baladas'],
    events: [],
    profilePicture:
        'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
];
