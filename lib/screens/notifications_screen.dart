import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Permisos requeridos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            PermissionTile(
              icon: Icons.camera_alt,
              title: 'Cámara',
              description:
                  'Usada para capturar fotos o video dentro de la app.',
            ),
            PermissionTile(
              icon: Icons.mic,
              title: 'Micrófono',
              description:
                  'Usado para grabar audio y capturar sonidos cuando se necesite.',
            ),
            PermissionTile(
              icon: Icons.location_on,
              title: 'GPS (ubicación)',
              description:
                  'Usado para obtener la ubicación actual y ofrecer servicios basados en ubicación.',
            ),
            PermissionTile(
              icon: Icons.storage,
              title: 'Almacenamiento',
              description:
                  'Usado para guardar y acceder archivos dentro de la app.',
            ),
          ],
        ),
      ),
    );
  }
}

class PermissionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const PermissionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
