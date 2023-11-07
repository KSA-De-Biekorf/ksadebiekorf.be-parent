Dit is de file structure om de website van KSA De Biekorf te kunnen
bewerken.

[ksadebiekorf.be-dist](/ksadebiekorf.be-dist) bevat de source code na builden
van [ksadebiekorf.be](/ksadebiekorf.be) en de andere repositories via het
script [build.sh](/publish.sh).

# Website updaten

1. bouw website & Kopieer/verplaats alle nodige files

```sh
./publish.sh
```

2. Publish to git

```sh
cd ksadebiekorf.be-dist
git add .
git commit -m "version number"
git push
```

3. Site testen

```
py -m http.server
```

4. Naar CPanel gaan en inloggen > Geavanceerd > Terminal

In de terminal:

```bash
$ cd public_html
$ git pull origin master
Enter passphrase for key '...': # Nu moet je het wachtwoord ingeven van de ssh key (vraag hiernaar)
```

5. Controleer de website

Controleer of alles nog werkt op [ksadebiekorf.be](https://ksadebiekorf.be)
