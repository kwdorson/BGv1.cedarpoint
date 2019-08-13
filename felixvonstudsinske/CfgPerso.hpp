/*
	CfgPerso.hpp
	
	Beim 1. mal Betreten des Servers kommt ein Dialog auf in dem die Perso-Daten gewählt werden müssen.
	
	ErlaubteNamenszeichen: copyToClipboard str (toArray "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyzßÄÖÜäöü")
	zEmail: copyToClipboard str (toArray "ABCDEFGHIJKLMNOPQRSTUVWXYZ-_abcdefghijklmnopqrstuvwxyz")
*/
class CfgPerso {
	class Einstellungen {
		PersoAusblenden = 41; // ^
		WestUngleicherName = 0;
		EastUngleicherName = 0;
		IndepUngleicherName = 0;
		CivUngleicherName = 0;
		MaximaleIdentitaeten[] = {1,3,1,1}; // WEST - CIV(default) - INDP - EAST
		KostenIdentitaetNeu[] = {{-1,0},{2,100000},{-1,0},{-1,0}}; // WEST - CIV(default) - INDP - EAST, { {größer -1 dann count > x, Kosten für diese neue Identität} }
		KostenIdentitaetLoeschen[] = {0,100000,0,0}; // WEST - CIV(default) - INDP - EAST
		KostenIdentitaetNameAendern[] = {0,100000,0,0}; // WEST - CIV(default) - INDP - EAST - Kosten zum Ändern des Namens
		KoerpergroesseVonBis[] = {150,220}; // Angaben von-bis in cm
		/* Alter des Spielers variiert nach Missionsdatum */
		GeburtsjahreVonBis[] = {1960,2017}; // Von bis
		KoerpergewichtVonBis[] = {45,135}; // Kg von bis
		Augenfarben[] = {"Blue","Green","Brown"}; // Array: Augenfarben
		Staatsangehoerigkeit[] = {
			{"Australia","Australian"},
			{"burundi","bruundisch"},
			{"Denmark","Danish"},
			{"Germany","German"},
			{"France","French"},
			{"Greece","Greek"},
			{"Italien","Italian"},
			{"Ireland","Irish"},
			{"America","American"},
			{"England","English"} // Siehe Exceltabelle "Perso - Staatsangehörigkeiten.ods"
		}; // Array: Angehörigkeiten
		
		class Identitaeten { // theoretisch unendlich viele Geschlechte möglich, zusätzlich im jeweiligen Script ändern, da sonst kein Aufruf
			class male {
				class Adnet {
					Name = "Adnet"; // <- Identitätsname (hier aus ArmA)
					Pfad = "images\Ausweis\Identitaeten\Adnet.paa"; // <-- Pfad zum Bild (jpg, paa, ..., kann auch Modfolder verwenden -> \addon\xx\pic.paa)
				};
				class Baros {
					Name = "Baros";
					Pfad = "images\Ausweis\Identitaeten\Baros.paa";
				};
				class Byrne {
					Name = "Byrne";
					Pfad = "images\Ausweis\Identitaeten\Byrne.paa";
				};
			};
			class female {
				class Bikini_Frau {
					Name = "Ms Bikini";
					Pfad = "images\Ausweis\Identitaeten\Bikini-Frau.paa";
				};
			};
			class other {
				class divers {
					Name = "Divers";
					Pfad = "#(rgb,8,8,3)color(0.2,0.35,0.1,1)";
				};
			};
		};
	};
	/* Gesicht aus den Profileinstellungen laden bzw. das aktuelle Gesicht des Spielers immer nehmen (welches der Charakte/die Einheit aktiv hat) */
	class Orte {
		class cedarpoint { // <-- Mapname hier eintragen
			class Abdera { // <-- Ortsklasse
				Postleitzahl = "39071";
				Name = "Abdera"; // <-- Anzeigename ingame des Ortes
				class Strassen {
					class KleineFelswand {
						Name = "Kleine Felswand";
						HausnummernVonBis[] = {1,5};
					};
					class KleinerFelsbogen {
						Name = "Kleiner Felsbogen";
						HausnummernVonBis[] = {1,3};
					};
					class RuhenderPlatz {
						Name = "Ruhender Platz";
						HausnummernVonBis[] = {1,2};
					};
				};
			};
			class Aggelochori {
				Postleitzahl = "34142";
				Name = "Aggelochori";
				class Strassen {
					class Strandmarsch {
						Name = "Strandmarsch";
						HausnummernVonBis[] = {1,2};
					};
					class Kavalastrasse {
						Name = "Kavalastrasse";
						HausnummernVonBis[] = {1,12};
					};
					class Renergusstrasse {
						Name = "Renergusstrasse";
						HausnummernVonBis[] = {1,12};
					};
					class Meerblick {
						Name = "Meerblick";
						HausnummernVonBis[] = {1,9};
					};
					class ZurFabrik {
						Name = "Zur Fabrik";
						HausnummernVonBis[] = {1,12};
					};
					class ZumSportplatz {
						Name = "Zum Sportplatz";
						HausnummernVonBis[] = {1,13};
					};
				};
			};
			class AgiosDionysios {
				Postleitzahl = "32892";
				Name = "Agios Dionysios";
				class Strassen {
					class Hauptstrasse {
						Name = "Hauptstrasse";
						HausnummernVonBis[] = {1,30};
					};
					class Palmenarm {
						Name = "Palmenarm";
						HausnummernVonBis[] = {1,12};
					};
					class ZumMischwalde {
						Name = "Zum Mischwalde";
						HausnummernVonBis[] = {1,6};
					};
				};
			};
			class Alikampos {
				Postleitzahl = "35557";
				Name = "Alikampos";
				class Strassen {
					class Schlesienstrasse {
						Name = "Schlesienstrasse";
						HausnummernVonBis[] = {1,13};
					};
					class Muehlenberg {
						Name = "Muehlenberg";
						HausnummernVonBis[] = {1,9};
					};
				};
			};
			class Anthrakia {
				Postleitzahl = "32449";
				Name = "Anthrakia";
				class Strassen {
					class Frickestrasse {
						Name = "Frickestrasse";
						HausnummernVonBis[] = {1,12};
					};
					class AnderKirche {
						Name = "An der Kirche";
						HausnummernVonBis[] = {1,9};
					};
					class ZurTraenke {
						Name = "Zur Traenke";
						HausnummernVonBis[] = {1,3};
					};
				};
			};
			class Athira {
				Postleitzahl = "39136";
				Name = "Athira";
				class Strassen {
					class ZumSportplatz {
						Name = "Zum Sportplatz";
						HausnummernVonBis[] = {1,12};
					};
					class AmMarkt {
						Name = "Am Markt";
						HausnummernVonBis[] = {1,9};
					};
					class Poststrasse {
						Name = "Poststrasse";
						HausnummernVonBis[] = {1,8};
					};
					class ZurFabrik {
						Name = "Zur Fabrik";
						HausnummernVonBis[] = {1,3};
					};
					class RichtungGlauben {
						Name = "Richtung Glauben";
						HausnummernVonBis[] = {1,10};
					};
				};
			};
			class Chalkeia {
				Postleitzahl = "32632";
				Name = "Chalkeia";
				class Strassen {
					class UeberdenHuegel {
						Name = "Ueber den Huegel";
						HausnummernVonBis[] = {1,8};
					};
					class ZurUrne {
						Name = "Zur Urne";
						HausnummernVonBis[] = {1,5};
					};
					class Friedensstrasse {
						Name = "Friedensstrasse";
						HausnummernVonBis[] = {1,2};
					};
				};
			};
			class Charkia {
				Postleitzahl = "34949";
				Name = "Charkia";
				class Strassen {
					class Muehlenblick {
						Name = "Muehlenblick";
						HausnummernVonBis[] = {1,5};
					};
					class Zweigstrasse {
						Name = "Zweigstrasse";
						HausnummernVonBis[] = {1,5};
					};
					class AmIndustriepark {
						Name = "Am Industriepark";
						HausnummernVonBis[] = {1,15};
					};
				};
			};
			class Dorida {
				Postleitzahl = "31593";
				Name = "Dorida";
				class Strassen {
					class ZumLichtschein {
						Name = "Zum Lichtschein";
						HausnummernVonBis[] = {1,2};
					};
					class ZumFelde {
						Name = "Zum Felde";
						HausnummernVonBis[] = {1,6};
					};
				};
			};
			class Feres {
				Postleitzahl = "38441";
				Name = "Feres";
				class Strassen {
					class VomWalde {
						Name = "Vom Walde";
						HausnummernVonBis[] = {1,5};
					};
				};
			};
			class Galati {
				Postleitzahl = "33300";
				Name = "Galati";
				class Strassen {
					class AmBerg {
						Name = "Am Berg";
						HausnummernVonBis[] = {1,12};
					};
					class AmBlumenbeet {
						Name = "Am Blumenbeet";
						HausnummernVonBis[] = {1,4};
					};
				};
			};
			class Gravia {
				Postleitzahl = "30932";
				Name = "Gravia";
				class Strassen {
					class Halbstrasse {
						Name = "Halbstrasse";
						HausnummernVonBis[] = {1,5};
					};
					class ZumFlugfeld {
						Name = "Zum Flugfeld";
						HausnummernVonBis[] = {1,7};
					};
					class VomSportplatz {
						Name = "Vom Sportplatz";
						HausnummernVonBis[] = {1,7};
					};
				};
			};
			class Kalithea {
				Postleitzahl = "35682";
				Name = "Kalithea";
				class Strassen {
					class Meerblick {
						Name = "Meerblick";
						HausnummernVonBis[] = {1,2};
					};
					class Fischerhafen {
						Name = "Fischerhafen";
						HausnummernVonBis[] = {1,3};
					};
				};
			};
			class Kalochori {
				Postleitzahl = "30352";
				Name = "Kalochori";
				class Strassen {
					class Matschweg {
						Name = "Matschweg";
						HausnummernVonBis[] = {1,10};
					};
					class Stettinerstrasse {
						Name = "Stettinerstrasse";
						HausnummernVonBis[] = {1,3};
					};
				};
			};
			class Katalaki {
				Postleitzahl = "39159";
				Name = "Katalaki";
				class Strassen {
					class Anglerpier {
						Name = "Anglerpier";
						HausnummernVonBis[] = {1,4};
					};
					class UeberdenKies {
						Name = "Ueber den Kies";
						HausnummernVonBis[] = {1,3};
					};
				};
			};
			class Kavala {
				Postleitzahl = "37690";
				Name = "Kavala";
				class Strassen {
					class Burgblick {
						Name = "Burgblick";
						HausnummernVonBis[] = {1,4};
					};
					class Hauptstrasse {
						Name = "Hauptstrasse";
						HausnummernVonBis[] = {1,25};
					};
					class AmKrankenhaus {
						Name = "Am Krankenhaus";
						HausnummernVonBis[] = {1,9};
					};
					class Palmenweg {
						Name = "Palmenweg";
						HausnummernVonBis[] = {1,8};
					};
					class Ruhrstrasse {
						Name = "Ruhrstrasse";
						HausnummernVonBis[] = {1,6};
					};
				};
			};
			class Kore {
				Postleitzahl = "38212";
				Name = "Kore";
				class Strassen {
					class ScharferBlick {
						Name = "Scharfer Blick";
						HausnummernVonBis[] = {1,5};
					};
					class Huegelweg {
						Name = "Huegelweg";
						HausnummernVonBis[] = {1,3};
					};
				};
			};
			class Lakka {
				Postleitzahl = "38023";
				Name = "Lakka";
				class Strassen {
					class Hauptstrasse {
						Name = "Hauptstrasse";
						HausnummernVonBis[] = {1,3};
					};
					class Fliegerwiese {
						Name = "Fliegerwiese";
						HausnummernVonBis[] = {1,4};
					};
				};
			};
			class Molos {
				Postleitzahl = "35026";
				Name = "Molos";
				class Strassen {
					class ZurSalzindustrie {
						Name = "Zur Salzindustrie";
						HausnummernVonBis[] = {1,8};
					};
					class Kreuzstrasse {
						Name = "Kreuzstrasse";
						HausnummernVonBis[] = {1,8};
					};
				};
			};
			class Negades {
				Postleitzahl = "38319";
				Name = "Negades";
				class Strassen {
					class AmHang {
						Name = "Am Hang";
						HausnummernVonBis[] = {1,12};
					};
					class ZumMeer {
						Name = "Zum Meer";
						HausnummernVonBis[] = {1,2};
					};
				};
			};
			class Neochori {
				Postleitzahl = "30854";
				Name = "Neochori";
				class Strassen {
					class AmWalde {
						Name = "Am Walde";
						HausnummernVonBis[] = {1,12};
					};
					class AmMarkt {
						Name = "Am Markt";
						HausnummernVonBis[] = {1,4};
					};
					class Hafenstrasse {
						Name = "Hafenstrasse";
						HausnummernVonBis[] = {1,3};
					};
					class Fischerweg {
						Name = "Fischerweg";
						HausnummernVonBis[] = {1,2};
					};
					class Gradestrasse {
						Name = "Gradestrasse";
						HausnummernVonBis[] = {1,2};
					};
					class Feldstrasse {
						Name = "Feldstrasse";
						HausnummernVonBis[] = {1,4};
					};
				};
			};
			class Neri {
				Postleitzahl = "39394";
				Name = "Neri";
				class Strassen {
					class Kirchenblick {
						Name = "Kirchenblick";
						HausnummernVonBis[] = {1,4};
					};
					class AmFelsbruch {
						Name = "Am Felsbruch";
						HausnummernVonBis[] = {1,5};
					};
					class Mannsweg {
						Name = "Mannsweg";
						HausnummernVonBis[] = {1,5};
					};
				};
			};
			class Oreokastro {
				Postleitzahl = "39399";
				Name = "Oreokastro";
				class Strassen {
					class ImOberland {
						Name = "Im Oberland";
						HausnummernVonBis[] = {1,9};
					};
					class Burgstrasse {
						Name = "Burgstrasse";
						HausnummernVonBis[] = {1,3};
					};
				};
			};
			class Panagia {
				Postleitzahl = "37410";
				Name = "Panagia";
				class Strassen {
					class Mischweg {
						Name = "Mischweg";
						HausnummernVonBis[] = {1,8};
					};
					class Kreuzstrasse {
						Name = "Kreuzstrasse";
						HausnummernVonBis[] = {1,4};
					};
				};
			};
			class Panochori {
				Postleitzahl = "35865";
				Name = "Panochori";
				class Strassen {
					class Kavalablick {
						Name = "Kavalablick";
						HausnummernVonBis[] = {1,9};
					};
					class UnterdemHang {
						Name = "Unter dem Hang";
						HausnummernVonBis[] = {1,6};
					};
				};
			};
			class Paros {
				Postleitzahl = "37708";
				Name = "Paros";
				class Strassen {
					class Hauptstrasse {
						Name = "Hauptstrasse";
						HausnummernVonBis[] = {1,21};
					};
					class Astweg {
						Name = "Astweg";
						HausnummernVonBis[] = {1,6};
					};
					class Zweigstrasse {
						Name = "Zweigstrasse";
						HausnummernVonBis[] = {1,1};
					};
					class Kaeufermarkt {
						Name = "Kaeufermarkt";
						HausnummernVonBis[] = {1,4};
					};
					class ZumUnterstand {
						Name = "Zum Unterstand";
						HausnummernVonBis[] = {1,6};
					};
				};
			};
			class Poliakko {
				Postleitzahl = "35182";
				Name = "Poliakko";
				class Strassen {
					class Huettenstrasse {
						Name = "Huettenstrasse";
						HausnummernVonBis[] = {1,8};
					};
					class ZurWende {
						Name = "Zur Wende";
						HausnummernVonBis[] = {1,2};
					};
				};
			};
			class Pyrgos {
				Postleitzahl = "36893";
				Name = "Pyrgos";
				class Strassen {
					class Hauptstrasse {
						Name = "Hauptstrasse";
						HausnummernVonBis[] = {1,12};
					};
					class Kanalweg {
						Name = "Kanalweg";
						HausnummernVonBis[] = {1,8};
					};
					class Muehlenstrasse {
						Name = "Muehlenstrasse";
						HausnummernVonBis[] = {1,5};
					};
					class Inselweg {
						Name = "Inselweg";
						HausnummernVonBis[] = {1,4};
					};
					class Felsenfest {
						Name = "Felsenfest";
						HausnummernVonBis[] = {1,4};
					};
					class Weinsbergwiese {
						Name = "Weinsbergwiese";
						HausnummernVonBis[] = {1,8};
					};
				};
			};
			class Rodopoli {
				Postleitzahl = "36602";
				Name = "Rodopoli";
				class Strassen {
					class AnzweiMuehlen {
						Name = "An zwei Muehlen";
						HausnummernVonBis[] = {1,4};
					};
					class Hauptstrasse {
						Name = "Hauptstrasse";
						HausnummernVonBis[] = {1,5};
					};
					class Kuesterweg {
						Name = "Kuesterweg";
						HausnummernVonBis[] = {1,4};
					};
				};
			};
			class Sofia {
				Postleitzahl = "30081";
				Name = "Sofia";
				class Strassen {
					class Hauptstrasse {
						Name = "Hauptstrasse";
						HausnummernVonBis[] = {1,16};
					};
					class AmSportplatz {
						Name = "Am Sportplatz";
						HausnummernVonBis[] = {1,6};
					};
					class Radarweg {
						Name = "Radarweg";
						HausnummernVonBis[] = {1,7};
					};
					class Langensberg {
						Name = "Langensberg";
						HausnummernVonBis[] = {1,6};
					};
				};
			};
			class Stavros {
				Postleitzahl = "34301";
				Name = "Stavros";
				class Strassen {
					class AnderNadel {
						Name = "An der Nadel";
						HausnummernVonBis[] = {1,12};
					};
					class ImNadelwald {
						Name = "Im Nadelwald";
						HausnummernVonBis[] = {1,4};
					};
					class AgiaMarinaweg {
						Name = "Agia Marinaweg";
						HausnummernVonBis[] = {1,4};
					};
				};
			};
			class Syrta {
				Postleitzahl = "37083";
				Name = "Syrta";
				class Strassen {
					class Girnaweg {
						Name = "Girnaweg";
						HausnummernVonBis[] = {1,11};
					};
					class Millerweg {
						Name = "Millerweg";
						HausnummernVonBis[] = {1,2};
					};
				};
			};
			class Telos {
				Postleitzahl = "31535";
				Name = "Telos";
				class Strassen {
					class ViererRad {
						Name = "Vierer Rad";
						HausnummernVonBis[] = {1,14};
					};
					class Hauptstrasse {
						Name = "Hauptstrasse";
						HausnummernVonBis[] = {1,3};
					};
					class Finanzweg {
						Name = "Finanzweg";
						HausnummernVonBis[] = {1,5};
					};
				};
			};
			class Therisa {
				Postleitzahl = "35427";
				Name = "Therisa";
				class Strassen {
					class Sonnenweg {
						Name = "Sonnenweg";
						HausnummernVonBis[] = {1,6};
					};
					class AmFeldplatz {
						Name = "Am Feldplatz";
						HausnummernVonBis[] = {1,3};
					};
				};
			};
			class Topolia {
				Postleitzahl = "38255";
				Name = "Topolia";
				class Strassen {
					class Ygontweg {
						Name = "Ygontweg";
						HausnummernVonBis[] = {1,2};
					};
				};
			};
			class Zaros {
				Postleitzahl = "31167";
				Name = "Zaros";
				class Strassen {
					class Glaubensweiser {
						Name = "Glaubensweiser";
						HausnummernVonBis[] = {1,12};
					};
					class AmSportplatz {
						Name = "Am Sportplatz";
						HausnummernVonBis[] = {1,6};
					};
					class ZurHauptstrasse {
						Name = "Zur Hauptstrasse";
						HausnummernVonBis[] = {1,8};
					};
					class AmWald {
						Name = "Am Wald";
						HausnummernVonBis[] = {1,4};
					};
				};
			};
		};
	};
};
#include "Personalausweis\Dialoge\Dialog_PersonalausweisAuswahl.hpp"
#include "Personalausweis\Dialoge\Dialog_PersonalausweisErstellen.hpp"
#include "Personalausweis\Dialoge\Dialog_PersonalausweisErstellenVorschau.hpp"