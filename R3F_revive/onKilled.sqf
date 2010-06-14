/**
 * Réaction à l'évènement killed : passe en mode caméra sur un hôpital, isole le corps respawner, appel la fonction d'attente de réanimation
 * 
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

// On ferme tout les fils d'exécution éventuels
terminate R3F_REV_fil_exec_attente_reanimation;
terminate R3F_REV_fil_exec_reapparaitre_camp;
terminate R3F_REV_fil_exec_effet_inconscient;

// Contexte interruptible et mémorisation du fil d'exécution lancé
R3F_REV_fil_exec_attente_reanimation = [] spawn
{
	closeDialog 0;
	
	if (R3F_REV_CFG_afficher_marqueur) then
	{
		deleteMarker R3F_REV_mark;
	};
	
	sleep 2;
	
	// Effet de fondu en noir pour symbolisé la mort du joueur
	ppEffectDestroy R3F_REV_effet_video_flou;
	R3F_REV_effet_video_flou = ppEffectCreate ["DynamicBlur", 401];
	R3F_REV_effet_video_flou ppEffectEnable true;
	R3F_REV_effet_video_flou ppEffectAdjust [0.3+random 0.3];
	R3F_REV_effet_video_flou ppEffectCommit 2;
	
	ppEffectDestroy R3F_REV_effet_video_couleur;
	R3F_REV_effet_video_couleur = ppEffectCreate ["ColorCorrections", 1501];
	R3F_REV_effet_video_couleur ppEffectEnable true;
	R3F_REV_effet_video_couleur ppEffectAdjust [0.25, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];
	R3F_REV_effet_video_couleur ppEffectCommit 2;
	
	// Attendre que le nouveau corps apparaissent
	waitUntil {alive player};
	
	sleep 0.2;
	// Mémorisation de la position du joueur lors de la réapparition
	R3F_REV_position_reapparition = getPos player;
	
	if (R3F_REV_nb_reanimations > 0) then
	{
		private ["_nb_soins_suppl"];
		
		// Isoler le nouveau corps
		player setPos [getPos R3F_REV_corps_avant_mort select 0, getPos R3F_REV_corps_avant_mort select 1, 2000];
		
		player setCaptive true;
		
		// Retrait de l'équipement
		removeAllWeapons player;
		removeAllItems player;
		
		// Couché sans arme dans les mains, posture blessé
		player switchMove "AmovPpneMstpSnonWnonDnon_injured";
		
		// Restauration des armes d'avant le décès
		{player addMagazine _x;} forEach (magazines R3F_REV_corps_avant_mort);
		{player addWeapon _x;} forEach (weapons R3F_REV_corps_avant_mort);
		
		// Ouverture de la boîte de dialogue qui permet le respawn base et de désactivation les interactions in-game
		closeDialog 0;
		createDialog "R3F_REV_dlg_attente_reanimation";
		titleText [localize "STR_R3F_REV_attente_reanimation", "PLAIN"];
		
		// On blesse le nouveau corps pour qu'il nécessite des soins d'un medic
		player setDamage 0.8;
		
		sleep 5;
		
		// Ramener le nouveau corps au lieu du décès
		player setVelocity [0, 0, 0];
		player setDir (getDir R3F_REV_corps_avant_mort);
		player setPos [getPos R3F_REV_corps_avant_mort select 0, getPos R3F_REV_corps_avant_mort select 1, ((getPosATL R3F_REV_corps_avant_mort select 2) - (getPos R3F_REV_corps_avant_mort select 2))];
		
		// Suppression de l'ancien corps
		deleteVehicle R3F_REV_corps_avant_mort;
		
		// On mémorise le nouveau corps pour la prochaine fois que le joueur mourra
		R3F_REV_corps_avant_mort = player;
		
		// Marqueur sur la position du joueur, si l'option est activée
		if (R3F_REV_CFG_afficher_marqueur) then
		{
			// On crée un marqueur sur la dernière position du projectile
			R3F_REV_mark = createMarker [("R3F_REV_mark_" + name player), getPos player];
			R3F_REV_mark setMarkerType "mil_triangle";
			R3F_REV_mark setMarkerColor "colorRed";
			R3F_REV_mark setMarkerText format [localize "STR_R3F_REV_marqueur_attente_reanimation", name player];
		};
		
		// Fil d'exécution générant des effets vidéo et d'animations symbolisant l'état inconscient
		// Il sera terminé dès que le joueur aura reçu des soins
		R3F_REV_fil_exec_effet_inconscient = [] spawn
		{
			while {true} do
			{
				R3F_REV_effet_video_flou ppEffectAdjust [0.3+random 0.3];
				R3F_REV_effet_video_flou ppEffectCommit 0;
				
				player playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
				R3F_REV_effet_video_couleur ppEffectAdjust [0.1+random 0.1, 0.4+random 0.2, 0, [1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0]];
				R3F_REV_effet_video_couleur ppEffectCommit (2.2+random 0.4);
				sleep 4.2+random 0.7;
				
				player playMoveNow "AmovPpneMstpSnonWnonDnon_injured";
				R3F_REV_effet_video_couleur ppEffectAdjust [0.25, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];
				R3F_REV_effet_video_couleur ppEffectCommit (1.7+random 0.2);
				sleep (6+random 8);
			};
		};
		
		// Attente d'un soin par medic
		while {damage player > 0.7} do {sleep 1;};
		
		// La réanimation peut nécessiter plusieurs action de soin
		for [{_nb_soins_suppl = floor random 3}, {_nb_soins_suppl > 0}, {_nb_soins_suppl = _nb_soins_suppl - 1}] do
		{
			// On blesse le nouveau corps pour qu'il nécessite des soins d'un medic
			player setDamage 0.8;
			player playMoveNow "AmovPpneMstpSnonWnonDnon_injured";
			
			// Attente d'un soin par medic
			while {damage player > 0.7} do {sleep 1;};
		};
		
		if (R3F_REV_CFG_afficher_marqueur) then
		{
			deleteMarker R3F_REV_mark;
		};
		
		// On le reblaisse quand même par mesure de réalisme
		player setDamage 0.4;
		
		// Retour en vue normale du jeu
		terminate R3F_REV_fil_exec_effet_inconscient;
		closeDialog 0;
		ppEffectDestroy R3F_REV_effet_video_flou;
		ppEffectDestroy R3F_REV_effet_video_couleur;
		
		sleep 0.2;
		// Stop animation blessé, reprise arme
		player selectWeapon (primaryWeapon player);
		player playMoveNow "AmovPpneMstpSrasWrflDnon";
		
		R3F_REV_nb_reanimations = R3F_REV_nb_reanimations - 1;
		
		// Il est de retour au combat, donc il n'est plus ignoré par l'IA
		player setCaptive false;
		
		if (R3F_REV_nb_reanimations > 0) then
		{
			if (R3F_REV_nb_reanimations > 1) then {titleText [format [localize "STR_R3F_REV_nb_reanimations_plusieurs", R3F_REV_nb_reanimations], "PLAIN"];}
			else {titleText [format [localize "STR_R3F_REV_nb_reanimations_une", R3F_REV_nb_reanimations], "PLAIN"];};
		}
		else {titleText [localize "STR_R3F_REV_nb_reanimations_zero", "PLAIN"];};
	}
	else
	{
		titleText [localize "STR_R3F_REV_plus_de_reanimation", "PLAIN"];
		
		if (!R3F_REV_CFG_autoriser_reapparaitre_camp) then
		{
			if (R3F_REV_CFG_autoriser_camera) then
			{
				player exec "camera.sqs";
			};
			
			// Rendre le corps mort sans activer son respawn
			player switchMove "AdthPpneMstpSrasWrflDnon_2";
			
			sleep 5;
			titleText [localize "STR_R3F_REV_hors_jeu", "PLAIN"];
			
			sleep 2;
			ppEffectDestroy R3F_REV_effet_video_flou;
			ppEffectDestroy R3F_REV_effet_video_couleur;
		}
		else
		{
			R3F_REV_nb_reanimations = R3F_REV_CFG_nb_reanimations;
			
			// Restauration des armes d'avant le décès
			removeAllWeapons player;
			removeAllItems player;
			{player addMagazine _x;} forEach (magazines R3F_REV_corps_avant_mort);
			{player addWeapon _x;} forEach (weapons R3F_REV_corps_avant_mort);
			player selectWeapon (primaryWeapon player);
			
			// Retour du corps au marqueur de réapparition
			player setVelocity [0, 0, 0];
			player setPos R3F_REV_position_reapparition;
			
			sleep 5;
			titleText [localize "STR_R3F_REV_respawn_camp", "PLAIN"];
			
			ppEffectDestroy R3F_REV_effet_video_flou;
			ppEffectDestroy R3F_REV_effet_video_couleur;
		};
		
		R3F_REV_corps_avant_mort = player;
	};
};