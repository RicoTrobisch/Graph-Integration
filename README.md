# Dokumentation
## Neue App Registration erstellen

Bevor die Graph Integration App genutzt werden kannn, muss eine App Registration im [Azure Portal](https://portal.azure.com/#home) angelegt werden.

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/90a4ba4c-535b-432d-9541-1997449782ba)


![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/d3e261dd-2d1a-4080-9eb8-3a005a7d61bb)


![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/2f3eb63f-c968-4ee9-a57f-b8539309427c)

Notiert Euch die *Client ID*. Hier benötigt Sie später in Business Central. 

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/b38efc6b-c682-40f5-8fd4-1fe2279f5e84)

Legt die passenden Graph Permissions (*Delegated* und *Application*) für die App Registration fast. 

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/10a9bdbf-e1ac-4ea2-9a8b-7aa6b6ad8ff7)

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/28500b7d-6bda-4837-a39f-3ddcb73532c1)

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/a0b479de-6014-4218-a217-d22a49e10fe7)

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/e4d2764b-24d4-4cba-8071-2765d02a6d56)

Ihr müsst den Permissions noch einmal zustimmen.

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/6454a99a-4f43-4598-99ba-0de9c57d8a46)

Anschließend erstellt Ihr ein neues Client Secret. ⚠️ Notiert Euch den *Value* des neu erstellten Client Secrets. ⚠️

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/17fd1956-e3a5-4a5f-820f-88b9d87bf241)

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/dd039bbd-c1b6-476f-8976-95c13320af11)

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/6c83b4b6-5a5b-4dec-8160-88f8eff8f317)

Definiert jetzt noch eine Redirect Url, wie im Screenshot zu sehen. *(https://businesscentral.dynamics.com/OAuthLanding.htm)*

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/975f1225-a83e-4a6f-ab56-1144650d4da8)


## Neue Entra Anwendung 

Erstellt in Business Central eine neue Entra Anwendung mit der Client ID der zuvor erstellten CLient ID. Aktiviert sie und vergebt Permissions.

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/1283b6ec-60bc-4d2e-81d6-8ce197089705)

Anschließend müsst Ihr der Anwendung noch einmal Zustimmung erteilen.

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/807a8b55-dc20-4998-a6c6-185435ae7e4f)

## Graph Setup
Füllt das Setup mit der Client ID und dem CLient Secret Value aus der erstellten App Registration. 
Als Scope bitte *https://graph.microsoft.com/.default* eintragen.

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/1143f6c9-3921-4e03-a5c5-5f7adac94abf)


## Refresh Graph Users
Anschließend könnt Ihr aus der Graph User List den Abruf der User und Lizenzen anstoßen.

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/c4552f56-4b23-4df3-b6c7-08e7df12e302)

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/b97e86b1-f4df-49a0-a939-cf8cc4c16278)

![image](https://github.com/RicoTrobisch/Graph-Integration/assets/92314263/de4bb3c2-6b9c-4651-8c6b-d3698ffda699)












