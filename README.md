# PocketBase Extensions

## Compatible Template
- [JuneFlut](https://github.com/melodysdreamj/JuneFlut)
- [JuneFlut-Web](https://github.com/melodysdreamj/JuneFlut-Web)

## Dependency Extensions
none

## Introduction
PocketBase is an open-source project that allows you to provide backend services with just one file. Please refer to [this site](https://pocketbase.io/) for more details.

## Current Support
- [x] Collection
- [ ] Storage
- [ ] Authentication

## How to Create a Service
You can follow [this guide](https://pocketbase.io/docs/) to install it on your own computer, or you can easily create and use it at a place called [PocketBase](https://app.pockethost.io/). As of the time of writing this, you can use one for free.

## Install Extensions
1. Go to the [JuneFlut](https://github.com/melodysdreamj/JuneFlut) or [JuneFlut-Web](https://github.com/melodysdreamj/JuneFlut-Web) GitHub and create your own project by following the guide.
2. In the terminal where your project is located, enter the following to add a plugin.
```bash
flutter pub add pocketbase:0.18.1
```
3. Please copy all the folders under the extension folder and paste them into the lib folder of your project.

## Connect to PocketBase
1. The way to use the database is generally the same as others. Please refer to this.
2. The difference from other databases is that there are two settings you need to configure when using Pocketbase.
   1. In `NewModelPocketBase`, please change the `PocketBase('http://127.0.0.1:8090/')` address to the URL of the Pocketbase you are using.
   2. Before using Pocketbase, you need to specify all collections, columns, and such in the admin panel. Please define the tables, columns, and indexes you want to create in the console.


































