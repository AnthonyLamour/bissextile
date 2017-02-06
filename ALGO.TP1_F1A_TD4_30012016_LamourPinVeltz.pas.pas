program landemain;

uses crt;

{ALGO année bissextile
BUT donner le landemain du jour entré par l'utilisateur
ENTREE un jour choisi par l'utilisateur
SORTIE le jour d'après

type date = enregistrement
			annee, mois, jour :ENTIER
finenregistrement

fonction bissextile (date : date) : BOOLEEN
BUT vérifier si une année est bissextile ou non
ENTREE une date
SORTIE vraie si bissextile faux si non bissextile

DEBUT
	SI (date.annee MOD 4 = 0) ET (date.annee MOD 100 <> 0) OU (date.annee MOD 400 = 0) ALORS
		bissextile<-VRAI
	SINON
		bissextile<-FAUX
	FINSI
FINFONCTION

fonction jourDansMois (date : date) :ENTIER
BUT déterminer le nombre de jour présent dans le mois entré
ENTREE une date
SORTIE le nombre de jour présent de le mois de la date
DEBUT
	SI (date.mois MOD 2 = 0) ET (date.mois < 8) ALORS
		jourDansMois <- 30;
	SINON
		SI (date.mois MOD 2 <> 0) ET (date.mois > 8) ALORS
			jourDansMois <- 30
		SINON
			jourDansMois <- 31
		FINSI
	FINSI
	
	SI date.mois = 2 ALORS
		SI (bissextile(date)) THEN
			jourDansMois<- 29
		SINON
			jourDansMois<- 28
		FINSI
	FINSI
FINFONCTION

VAR
	dateEntree, dateSortie : date
	conditionJour : BOOLEEN

DEBUT

	ECRIRE"Entrez une année"
	LIRE dateEntree.annee
	REPETER
		ECRIE"Entrez un mois (en nombre)"
		LIRE dateEntree.mois 
	JUSQU'A (dateEntree.mois >=1) ET (dateEntree.mois <= 12)
	
	REPETER
		ECRIRE"Entrez un jour"
		LIRE dateEntree.jour
	JUSQU'A (dateEntree.jour >=1) ET (dateEntree.jour <= jourDansMois(dateEntree))
	
	dateSortie.jour <- dateEntree.jour + 1
	dateSortie.mois<-dateEntree.mois
	dateSortie.annee<-dateEntree.annee
	
	SI (dateSortie.jour > jourDansMois(dateEntree)) ALORS
		dateSortie.jour <- 1
		dateSortie.mois <- dateEntree.mois + 1
	FINSI
	
	SI (dateSortie.mois > 12) ALORS
		dateSortie.jour<-1
		dateSortie.mois<-1
		dateSortie.annee<-dateEntree.annee + 1
	FINSI
	ECRIREdateSortie.jour&","&dateSortie.mois&","&dateSortie.annee)
	
FIN

Jeu d'essai

ENTREE

	28 02 2016			-28 -02 -2016			50 80 2016				28 02 2017			0 02 2016
SORTIE
	29 02 2016			redemande de saisi		redemande de saisie		01 03 2017			redemande de saisi
}

type
	date = record
		annee, mois, jour :integer;
end;

function bissextile (date : date) : BOOLEAN;
BEGIN
	IF (date.annee MOD 4 = 0) AND (date.annee MOD 100 <> 0) OR (date.annee MOD 400 = 0) THEN
		begin
			bissextile:=TRUE;
		end
	ELSE
		begin
			bissextile:=FALSE;
		end;
END;

function jourDansMois (date : date) :integer;
BEGIN
	IF (date.mois MOD 2 = 0) AND (date.mois < 8) THEN
		begin
			jourDansMois := 30;
		end
	ELSE
		begin
			IF (date.mois MOD 2 <> 0) AND (date.mois > 8) THEN
				begin
					jourDansMois := 30
				end
			ELSE
				begin
					jourDansMois := 31
				end;
		end;
	
	IF date.mois = 2 THEN
		begin
			IF bissextile(date) THEN
				begin
					jourDansMois:= 29
				end
			ELSE
				begin
					jourDansMois:= 28
				end;
		end;
END;

VAR
	dateEntree, dateSortie : date;
	conditionJour : BOOLEAN;

BEGIN
	clrscr;
	writeln('Entrez une annee');
	readln(dateEntree.annee);
	REPEAT
		writeln('Entrez un mois (en nombre)');
		readln(dateEntree.mois);
	UNTIL (dateEntree.mois >=1) AND (dateEntree.mois <= 12);
	
	REPEAT
		writeln('Entrez un jour');
		readln(dateEntree.jour);
	UNTIL (dateEntree.jour >=1) AND (dateEntree.jour <= jourDansMois(dateEntree));
	
	dateSortie.jour := dateEntree.jour + 1;
	dateSortie.mois:=dateEntree.mois;
	dateSortie.annee:=dateEntree.annee;
	
	IF (dateSortie.jour > jourDansMois(dateEntree)) THEN
		begin
			dateSortie.jour := 1;
			dateSortie.mois := dateEntree.mois + 1;
		end;
	
	IF (dateSortie.mois > 12) THEN
		begin
			dateSortie.jour:=1;
			dateSortie.mois:=1;
			dateSortie.annee:=dateEntree.annee + 1;
		end;
	writeln(dateSortie.jour,',',dateSortie.mois,',',dateSortie.annee);
	readln;
END.