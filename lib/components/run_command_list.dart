class Commands {
  Commands({
    this.title,
    this.subtitle,
    this.function,
    this.isRedCommand,
  });

  String title;
  String subtitle;
  Function function;
  bool isRedCommand;
}

List<Commands> runCommandsList = [
  Commands(
    title: 'Lock Screen',
    subtitle: 'loginctl lock-session',
    isRedCommand: false,
    function: () {},
  ),
  Commands(
    title: 'Restart',
    subtitle: 'systemctl restart',
    isRedCommand: true,
    function: () {},
  ),
  Commands(
    // todo require device biometric authentication before unlocking
    title: 'Unlock Screen',
    subtitle: 'loginctl unlock-session',
    isRedCommand: true,
    function: () {},
  ),
  Commands(
    title: 'Maximum Brightness',
    subtitle: 'Maximum brightness',
    isRedCommand: false,
    function: () {},
  ),
  Commands(
    title: 'Suspend',
    subtitle: 'systemctl suspend',
    isRedCommand: true,
    function: () {},
  ),
  Commands(
    title: 'Close All Vaults',
    subtitle: 'Close All Vaults',
    isRedCommand: false,
    function: () {},
  ),
  Commands(
    title: 'Forcefully Close All Vaults',
    subtitle: 'Forcefully Close All Vaults',
    isRedCommand: false,
    function: () {},
  ),
  Commands(
    title: 'Send Ping',
    subtitle: 'Send Ping to your computer',
    isRedCommand: false,
    function: () {},
  ),
  Commands(
    title: 'Ring',
    subtitle: 'Ring your phone',
    isRedCommand: false,
    function: () {},
  ),
];
