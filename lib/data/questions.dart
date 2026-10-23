import 'package:quiz_app/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'What is the main goal of cybersecurity?',
    [
      'To protect systems, networks, and data from attacks',
      'To develop websites',
      'To install operating systems',
      'To increase internet speed',
    ],
    explanation:
        'Cybersecurity protects the confidentiality, integrity and availability (CIA triad) of systems and data.',
  ),
  QuizQuestion(
    'What does a firewall do?',
    [
      'Monitors and controls incoming and outgoing network traffic',
      'Detects viruses in hardware devices',
      'Increases computer speed',
      'Encrypts emails only',
    ],
    explanation:
        'A firewall allows or blocks traffic based on a set of security rules.',
  ),
  QuizQuestion(
    'Which of the following is an example of social engineering?',
    [
      'Phishing email asking for login credentials',
      'Installing antivirus software',
      'Configuring a router',
      'Running a system update',
    ],
    explanation:
        'Social engineering manipulates people, not machines, into giving up access or information.',
  ),
  QuizQuestion(
    'What is malware?',
    [
      'Malicious software designed to harm or exploit systems',
      'A software update',
      'A password manager',
      'An encrypted file',
    ],
    explanation:
        'Viruses, worms, trojans, ransomware and spyware are all types of malware.',
  ),
  QuizQuestion(
    'What does VPN stand for?',
    [
      'Virtual Private Network',
      'Verified Public Node',
      'Virtual Protected Network',
      'Variable Privacy Network',
    ],
    explanation:
        'A VPN creates an encrypted tunnel between your device and a remote server.',
  ),
  QuizQuestion(
    'Which of the following helps in encrypting data during transfer?',
    [
      'SSL/TLS',
      'HTTP',
      'FTP',
      'DNS',
    ],
    explanation:
        'TLS encrypts data in transit. It is the "S" in HTTPS.',
  ),
  QuizQuestion(
    'What should a strong password include?',
    [
      'Uppercase, lowercase, numbers, and special characters',
      'Only lowercase letters',
      'Only numbers',
      'Only your name and birthdate',
    ],
    explanation:
        'Length and variety make passwords harder to brute-force. Pair them with MFA.',
  ),
  QuizQuestion(
    'What is the main purpose of an antivirus program?',
    [
      'To detect and remove malicious software',
      'To increase processor speed',
      'To manage system updates',
      'To create firewalls automatically',
    ],
    explanation:
        'Antivirus tools use signatures and behaviour analysis to find and remove malware.',
  ),
  QuizQuestion(
    'What does “phishing” mean in cybersecurity?',
    [
      'Tricking users into revealing personal information',
      'Using multiple passwords for one account',
      'Encrypting sensitive files',
      'Scanning for network vulnerabilities',
    ],
    explanation:
        'Phishing uses fake emails, sites or messages that look trustworthy to steal data.',
  ),
  QuizQuestion(
    'Which type of attack floods a server with traffic to make it unavailable?',
    [
      'Denial of Service (DoS) attack',
      'Phishing attack',
      'SQL injection',
      'Man-in-the-middle attack',
    ],
    explanation:
        'A DoS (or distributed DDoS) attack targets availability by overwhelming resources.',
  ),
];
