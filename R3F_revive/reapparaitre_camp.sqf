/**
 * Fait réapparaître un joueur en attente de réanimation à la base
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

// Mémorisation du fil d'exécution lancé
R3F_REV_fil_exec_reapparaitre_camp = [] spawn
{
	closeDialog 0;
	
	if (R3F_REV_CFG_afficher_marqueur) then
	{
		deleteMarker R3F_REV_mark;
	};
	
	// On masque ce qui se passe au joueur (joueur dans les airs + animations forcés)
	R3F_REV_effet_video_couleur ppEffectAdjust [0.25, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];
	R3F_REV_effet_video_couleur ppEffectCommit 0;
	titleText [localize "STR_R3F_REV_reapparition_camp_en_cours", "PLAIN"];
	
	R3F_REV_corps_avant_mort = player;
	
	// Isoler le corps
	player setPos [getPos player select 0, getPos player select 1, 2000];
	
	player setDamage 0;
	
	// Stop animation blessé, reprise arme debout
	player selectWeapon (primaryWeapon player);
	player playMoveNow "AmovPercMstpSlowWrflDnon";
	
	sleep 5;
	
	// Retour du corps au marqueur de réapparition
	player setVelocity [0, 0, 0];
	player setPos R3F_REV_position_reapparition;
	
	player setCaptive false;
	
	// Restauration du nombre de réanimations possibles
	R3F_REV_nb_reanimations = R3F_REV_CFG_nb_reanimations;
	
	titleText ["", "PLAIN"];
	ppEffectDestroy R3F_REV_effet_video_flou;
	ppEffectDestroy R3F_REV_effet_video_couleur;
};