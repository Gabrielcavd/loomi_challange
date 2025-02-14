# 📱 Streaming Loo

**Descrição:** Aplicativo de streaming para conforme foi descrito no desafio do Loomi

## 🚀 Tecnologias Utilizadas

- Flutter (Dart)
- Gerenciamento de estado: (GetX)
- APIs: (REST, Firebase)
- Outras ferramentas: (Firebase, Video_player, Dio, Shared_preferences)

## 📋 Requisitos

- Flutter SDK versão 3.22.2
- Dart versão 3.4.3
- Android Studio ou VS Code
- Emulador ou dispositivo físico para testes

## 🔧 Instalação e Configuração

1. Clone o repositório:
   ```bash
   git clone https://github.com/Gabrielcavd/loomi_challange/
   cd repositorio
   ```
2. Instale as dependências:
   ```bash
   flutter pub get
   ```
3. Execute o projeto:
   ```bash
   flutter run
   ```

## 📂 Estrutura do Projeto

```plaintext
/lib
 ├── main.dart  # Inicialilza o projeto
 ├── main_app.dart  # Arquivo principal
 ├── core/      # Configurações globais, temas, constantes
 ├── core/data/      # Modelos, repositórios e fontes de dados
 ├── core/components   # Componentes reutilizáveis
 ├── modules/   # Módulos organizados por funcionalidade 
```

## ✨ Funcionalidades Principais

- [x] Login social com Google
- [x] Tela de cadastro onde o usuário pode se cadastrar no aplicativo
- [x] Tela de onboarding, onde o usuário pode selecionar uma foto para o seu perfil e atualizar o seu nome
- [x] Uma tela de home em que o usuário verá a opção de filme disponível para assistir, dar like, compartilhar e acessar o perfil do usuário
- [x] Uma tela com um player de vídeo
- [x] Uma tela em que o usuário pode ver comentários sobre o filme
- [x] Uma tela de dados de perfil, no qual o usuário pode acessar a tela de trocar de senha, apagar conta, lista de filmes assistidos, editar os dados da conta e acessar os dados da assinatura

## 📦 Build e Deploy

Gerar um APK:
```bash
flutter build apk
```
Gerar um app bundle:
```bash
flutter build appbundle
```
