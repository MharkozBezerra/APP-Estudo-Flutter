# app_clone_whatsapp

Projeto de estudo com flutter utilizando firebase

## Getting Started

Este projeto está rodando com o banco de dados da google, Firebase.
Utilizando as bibliotécas:
- [firebase_core 1.0.3]    (https://pub.dev/packages/firebase_core)
- [firebase_auth 1.0.2]    (https://pub.dev/packages/firebase_auth)
- [firebase_storage 8.0.2] (https://pub.dev/packages/firebase_storage)
- [cloud_firestore 1.0.4 ] (https://pub.dev/packages/cloud_firestore)

SDK Flutter, nesse projeto encontra-se na versão :2.0.2 estável.
-Mharkoz Bezerra

Fluxo de telas:

1-> Login
2-> Cadastro de novo usuário
3-> Home

Imagens do app:
"Todos arquivos dentro da pasta assets"
    - assets/imagens/logo.png
    - assets/imagens/usuario.png

Arquitetura MVC "Model View Controller"
Model:
 - model_usuario.dart / classe: ModelUsuario
View:
 - view_login.dart /classe: Login
 - view_cadastro.dart / classe: Cadastro
 - view_home.dart / classe: Home
Controller:
 - controller_usuario.dart / classe: ControllerUsuario


