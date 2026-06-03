#Affichage du chemin absolu du dossier courant 

echo "Affichage du chemin absolu du dossier courant : " 
pwd
echo -e "\n\n"
#Affichage du  contenu de ce dossier avec les details complets : permissions, proprietaire, taille et date de modification.
echo "Affichage du  contenu de ce dossier avec les details complets : permissions, proprietaire, taille et date de modification."
ls -l

echo -e "\n\n"
#Creons un dossier ama_piscine dans le  dossier courant.
echo "Creation d' un dossier ama_piscine dans le dossier courant."
if [ -d "ama_piscine" ]; then
	echo "Creation echouer"
else
	mkdir ama_piscine
	echo "Creation reussi"
fi

echo -e "\n\n"
#Entrons dans ama_piscine et confirmons la position avec une commande.
echo "Entrons dans ama_piscine et confirmons la position avec une commande."
cd ama_piscine && pwd

echo -e "\n\n"
#Creons d’un seul coup et en une seule commande les trois sous-dossiers : jour1, jour2, jour3.
echo "Creons d’un seul coup et en une seule commande les trois sous-dossiers : jour1, jour2, jour3."
mkdir jour1 jour2 jour3

echo -e "\n\n"
#Entrons dans jour1 et cree les fichiers suivants en une seule commande : script.sh, notes.txt,donnees.csv, rapport.md.
echo "Entrons dans jour1 et cree les fichiers suivants en une seule commande : script.sh, notes.txt,donnees.csv, rapport.md."
cd  jour1 && touch script.sh notes.txt donnees.csv rapport.md

echo -e "\n\n"
#Affichons le contenu de jour1 avec les details. Verifie que les 4 fichiers sont bien presents
echo "Affichons le contenu de jour1 avec les details. Verifie que les 4 fichiers sont bien presents"
ls -l

echo -e "\n\n"
#Sans ouvrir aucun editeur, ecricons la ligne suivante dans notes.txt :AMA - Piscine Cohorte 2 - Jour 1 
echo "Sans ouvrir aucun editeur, ecris la ligne suivante dans notes.txt : AMA - Piscine Cohorte 2 - Jour 1 "
echo "AMA - Piscine Cohorte 2 - Jour 1" > notes.txt

echo -e "\n\n"
#Ajoute ensuite ces trois lignes a la suite dans notes.txt, sans ecraser ce qui existe deja :
echo -e "Etudiant : Judicael\nDate : 02/06/2026\nStatut : En cours" >> notes.txt

echo -e "\n\n"
#Affichons le contenu complet de notes.txt dans le terminal.
echo "Affichons le contenu complet de notes.txt dans le terminal."
cat notes.txt

echo -e "\n\n"
#Affichons uniquement la premiere ligne de notes.txt.
echo "Affichons uniquement la premiere ligne de notes.txt."
head -n 1 notes.txt

echo -e "\n\n"
#Affichons uniquement la derniere ligne de notes.txt.
echo "Affichons uniquement la derniere ligne de notes.txt."
tail -n 1 notes.txt

echo -e "\n\n"
#Comptons le nombre de lignes dans notes.txt et affiche le resultat.
echo "Comptons le nombre de lignes dans notes.txt et affiche le resultat."
wc -l notes.txt

echo -e "\n\n"
#Cherchons le mot Statut dans notes.txt et affiche la ligne correspondante.
echo "Cherchons le mot Statut dans notes.txt et affiche la ligne correspondante."
grep -n  "Statut" notes.txt

echo -e "\n\n"
#Copions notes.txt dans jour2 et dans jour3 en deux commandes separees.
echo "Copions notes.txt dans jour2 et dans jour3 en deux commandes separees."
cp notes.txt ../jour2
cp notes.txt ../jour3

echo -e "\n\n"
#Remontons dans ama_piscine. Affichons l’arborescence complete de tous les dossiers et fichiers
echo "Remontons dans ama_piscine. Affichons l’arborescence complete de tous les dossiers et fichiers"
cd .. && tree

echo -e "\n\n"
#Renommons donnees.csv en resultats_jour1.csv.
echo "Renommons donnees.csv en resultats_jour1.csv."
mv jour1/donnees.csv jour1/resultats_jour1.csv.

echo -e "\n\n"
#Deplacons rapport.md depuis jour1 vers jour2.
echo "Deplacons rapport.md depuis jour1 vers jour2."
mv jour1/rapport.md jour2

echo -e "\n\n"
#Supprimons le fichier script.sh de jour1.
echo "Supprimons le fichier script.sh de jour1."
rm jour1/script.sh

echo -e "\n\n"
#Verifions le contenu final de chaque dossier : jour1, jour2, jour3
echo "Verifions le contenu final de chaque dossier : jour1, jour2, jour3"
tree

echo -e "\n\n"
#Depuis ama_piscine, trouvons tous les fichiers .txt presents dans l’arborescence
echo "Depuis ama_piscine, trouvons tous les fichiers .txt presents dans l’arborescence"
find -name "*.txt"

echo -e "\n\n"
#Trouvons tous les fichiers dont le nom contient notes.
echo "Trouvons tous les fichiers dont le nom contient notes."
find -name "notes.*"

echo -e "\n\n"
#Affichons la version de Python installee sur ta machine.
#La version est affiche si python est sur la machine
 echo "Python est sur la machine :"
if  python --version ; then

echo -e "\n\n"
echo "Emplacement de python"
	which python
	pip list && pip list > jour1/librairies.txt
	
echo -e "\n\n"
	for lib in numpy scipy sympy; do 
		if python -c "import $lib" 2>/dev/null ; then
			echo "[OK] $lib"
		else
			echo "[MANQUANTE $lib]"
		fi
	done

echo -e "\n\n"
	echo "Affichage du recapitulatif :"
	echo "	Arborescence"
	tree
	echo "	Contenu de notes.txt"
	cat jour1/notes.txt
	echo "	Liste des librairies verifiees"
	for lib in numpy scipy sympy; do 
                        echo "$lib"
        done

else 
	echo "ERREUR : Python n'est sur cette machine"
fi
