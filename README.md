Dit is de file structure om de website van KSA De Biekorf te kunnen
bewerken.

[ksadebiekorf.be-dist](/ksadebiekorf.be-dist) bevat de source code na builden
van [ksadebiekorf.be](/ksadebiekorf.be) en de andere repositories via het
script [build.sh](/publish.sh).

# Website updaten

1. Bouw de website

```sh
cd ./ksadebiekorf.be
pnpn run build
```

2. Kopieer/verplaats alle nodige files

Terug in de root:

```sh
./publish.sh
```

3. Naar CPanel gaan en inloggen > Geavanceerd > Terminal

In de terminal:

```bash
$ cd public_html
$ git pull origin master
Enter passphrase for key '...': # Nu moet je het wachtwoord ingeven van de ssh key (vraag hiernaar)
```

4. Controleer de website

Controleer of alles nog werkt op [ksadebiekorf.be](https://ksadebiekorf.be)
