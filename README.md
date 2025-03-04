# DoItRos2

![QR Code https://github.com/kraeml/DoItRos2](./picts/github.png)

## Projektabstrakt

DoItRos2 stellt eine vorkonfigurierte Ubuntu 22.04 Vagrant Maschine zur Verfügung, auf der ROS2 Humble bereits installiert und einsatzbereit ist. Dieses Projekt ermöglicht es Entwicklern und Forschern, schnell und einfach mit ROS2 zu arbeiten, ohne sich um die komplexe Installation und Konfiguration kümmern zu müssen.

## Voraussetzungen

- Vagrant https://developer.hashicorp.com/vagrant/install?product_intent=vagrant
- VirtualBox https://www.virtualbox.org/wiki/Downloads

## Installation und Nutzung

1. Installieren Sie Vagrant und VirtualBox auf Ihrem System.
2. Klonen Sie das Repository:
   ```bash
   git clone https://github.com/kraeml/DoItRos2.git
   cd DoItRos2
   ```
3. Starten Sie die Vagrant-Maschine:
   ```bash
   vagrant up
   ```
4. Verbinden Sie sich mit der Vagrant-Maschine:
   ```bash
   vagrant ssh
   ```
5. ROS2 Humble ist nun einsatzbereit, ohne weitere Installationsschritte.

## Technologien und Abhängigkeiten

- Ubuntu 22.04
- ROS2 Humble
- Vagrant
- VirtualBox

## Lokale Ausführung

Nach dem Start der Vagrant-Maschine mit `vagrant up` können Sie:

1. Auf die ROS2-Umgebung zugreifen:
   ```bash
   vagrant ssh
   source /opt/ros/humble/setup.bash
   ```
2. ROS2-Befehle ausführen, z.B.:
   ```bash
   ros2 run demo_nodes_cpp talker
   ```
3. Öffnen Sie ein neues Terminal und geben Sie Folgendes ein:
   ```bash
   vagrant ssh
   source /opt/ros/humble/setup.bash
   ```
4. ROS2-Befehle ausführen, z.B.:
   ```bash
   ros2 run demo_nodes_py listener
   ```

## Hauptfunktionen

- Schneller Einstieg in ROS2-Entwicklung
- Vorkonfigurierte Umgebung für ROS2-Projekte
- Ideal zum Erlernen von ROS2-Konzepten
- __TODO__ Unterstützung für den Roboter Pib (https://pib.rocks) 

## Lizenz

[Hier Lizenzinformationen einfügen]

## Kontakt

[Kontaktinformationen des Autors hier einfügen]

## Zusätzliche Informationen

Dieses Projekt dient als Lehr- und Lernhilfe für ROS2. Zukünftige Erweiterungen könnten zusätzliche ROS2-Pakete oder erweiterte Konfigurationsoptionen umfassen.

## Sicherheitshinweise

- Aktualisieren Sie regelmäßig die Vagrant-Box und alle installierten Pakete.
- Verwenden Sie sichere Passwörter für die Vagrant-Maschine.
- Beschränken Sie den Netzwerkzugriff auf die Vagrant-Maschine nach Bedarf.

## Verwandte Ressourcen

- [ROS2_Tutorial: (Murilo's) ROS2 Tutorial](https://ros2-tutorial.readthedocs.io/en/latest/)
- [Offizielle ROS2 Humble Tutorials](https://docs.ros.org/en/humble/Tutorials.html)
- [Aleksandar Haber's ROS2 Tutorials](https://aleksandarhaber.com/ros2-tutorials/)

## ROS2-Installationstest

Um zu überprüfen, ob ROS2 korrekt installiert ist, folgen Sie den Anweisungen unter [How to check if ROS2 is installed and how to check ROS2 version](https://aleksandarhaber.com/how-to-check-if-ros2-is-installed-and-how-to-check-ros2-version/)

## Projekt-Repository

Das offizielle GitHub-Repository finden Sie unter: [https://github.com/kraeml/DoItRos2](https://github.com/kraeml/DoItRos2)
