/**
 * Initialisation du système de réanimation
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

#include "config.sqf"

if (!isServer || !isDedicated) then
{
	[] spawn
	{
		// Attente d'initialisation du joueur
		waitUntil {!(isNull player)};
		
		/** Mémorise le corps du joueur avant respawn */
		R3F_REV_corps_avant_mort = player;
		
		/** Mémorise la position à laquelle le joueur est réapparu avant le retour au lieu du décès (typiquement : marqueur respawn_west) */
		R3F_REV_position_reapparition = getPos player;
		
		/** Contiendra l'instance de la dernière exécution de la réaction à l'évènement "killed" */
		R3F_REV_fil_exec_attente_reanimation = [] spawn {};
		
		/** Contiendra l'instance de la dernière exécution de la fonction R3F_REV_FNCT_reapparaitre_camp */
		R3F_REV_fil_exec_reapparaitre_camp = [] spawn {};
		
		/** Contiendra l'instance de la dernière boucle d'effets symbolisant l'effet inconscient */
		R3F_REV_fil_exec_effet_inconscient = [] spawn {};
		
		/** Nombre de vies restantes au joueur */
		R3F_REV_nb_reanimations = R3F_REV_CFG_nb_reanimations;
		
		/** Code à exécuter lors de la mort du joueur */
		R3F_REV_FNCT_onKilled = compile preprocessFile "R3F_revive\onKilled.sqf";
		
		/** Code ramenant le joueur au camp alors qu'il est en attente de réanimation */
		R3F_REV_FNCT_reapparaitre_camp = compile preprocessFile "R3F_revive\reapparaitre_camp.sqf";
		
		/** Démarre la phase d'attente de revive sur l'évènement "killed" */
		player addEventHandler ["killed", R3F_REV_FNCT_onKilled];
		
		// On empêche un infirmier de se réanimer lui même
		player addEventHandler ["HandleHeal",
		{
			// S'il est en phase d'attente de réanimation et qu'il se soigne lui même
			if (!(scriptDone R3F_REV_fil_exec_attente_reanimation) && (_this select 0 == _this select 1)) then
			{
				[] spawn
				{
					titleText [localize "STR_R3F_REV_ne_pas_se_reanimer_soi_meme", "PLAIN"];
					waitUntil {scriptDone R3F_REV_fil_exec_attente_reanimation};
					R3F_REV_nb_reanimations = R3F_REV_nb_reanimations + 1;
					call R3F_REV_FNCT_onKilled;
				};
			};
		}];
	};
};