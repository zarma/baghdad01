Sleep 1;
mando_airsupport_type = "AV8B2";
mando_airsupport_type_rc = "AV8B";
mando_reco_cam_pos = [0,3,-2];
mando_airsupport_cmissile = ship1;


mando_airsupport_armedrec = true;
mando_airsupport_armedrec_man = false; // Set it to true for manual guidance for missiles fired from armed reco planes
mando_airsupport_armedrec_max = 3;
mando_airsupport_bomb_altmax = 1000;
mando_ingress_dir = 45;
mando_airsupport_bomb_alt = 150;
mando_airsupport_cmissile = ship1;
mando_airsupport_cmissile_pos = [0,-4, 1];
mando_airsupport_cmissile_alt = 300;

mando_support_left_WEST = 3;
mando_support_left_ca_WEST = 2;
mando_support_left_cm_WEST = 0;
mando_support_left_pa_WEST = 2;
mando_support_left_rc_WEST = 2;
mando_support_left_am_WEST = 2;
mando_support_left_ve_WEST = 0;
mando_support_left_re_WEST = 0;
mando_support_left_cp_WEST = 1;
mando_support_left_sa_WEST = 2;
mando_support_left_ev_WEST = 0;
mando_support_left_la_WEST = 2;
mando_support_left_cb_WEST = 3;


mando_console_radio_delay = 5;

/*
mando_radio_req_cas =  ;
mando_radio_rep_cas =  ;
mando_radio_req_br = ;
mando_radio_rep_br = ;
mando_radio_req_gs = ;
mando_radio_rep_gs = ;
mando_radio_req_ab = ;
mando_radio_rep_ab = ;
mando_radio_rep_ab = ;
mando_radio_req_cm = ;
mando_radio_rep_cm = ;
mando_radio_req_sa = ;
mando_radio_rep_sa = ;
mando_radio_req_am = ;
mando_radio_rep_am = ;
mando_radio_repr_am = ;
mando_radio_req_ve = ;
mando_radio_rep_ve = ;
mando_radio_repr_ve = ;
mando_radio_req_re = ;
mando_radio_rep_re = ;
mando_radio_repr_re = ;
mando_radio_req_cp = ;
mando_radio_rep_cp = ;
mando_radio_req_rc = ;
mando_radio_rep_rc = ;
mando_radio_req_ev = ;
mando_radio_rep_ev = ;
mando_radio_repr_ev = ;
mando_radio_req_la = ;
mando_radio_rep_la = ;
mando_radio_req_cb = ;
mando_radio_rep_cb = ;
*/

mando_airsupport_jump = false; // reinforcements and airborne assault will land and disembark instead of jump from chopper.

mando_support_no_cas = false;
mando_support_no_br = false;
mando_support_no_ff = false;
mando_support_no_sa = true;
mando_support_no_gs = false;
mando_support_no_ab = false;
mando_support_no_cm = true;
mando_support_no_sat = false;
mando_support_no_rc = false;
mando_support_no_ev = true;
mando_support_no_la = false;
mando_support_no_am = false;
mando_support_no_ve = true;
mando_support_no_re = true;
mando_support_no_cp = false;
mando_support_no_cb = false;


// Info text displayed in the setup / info dialog (this is an structured text)
mando_airsupport_info = "Mission info: <br />Try altitudes between 190 and 250m for carpet bombing using AV8B.<br /><br />Note that the options you see below are fully customizable using globals (same as this text block), check online help for more info.";


// Setup dialog options 1, 2 and 3, dont set any of these variables if you dont want special options
mando_airsupport_opt1_text = "Gunships support type";
mando_airsupport_opt1_array = ["AH1Z", "AH64D",	"A10"];
mando_airsupport_opt1_action = 
{
   private["_item"];
   _item = _this select 0;
   mando_airsupport_type_ca = _item;
};


mando_airsupport_opt2_text = "Reinforcements type";
mando_airsupport_opt2_array = ["Normal", "Heavy AA","Heavy MG","Engineers"];
mando_airsupport_opt2_action = 
{
   private["_item"];
   _item = _this select 0;
   switch (_item) do
   {
      case "Normal":
      {
         mando_support_infantrytype_re = ["USMC_Soldier_TL", "USMC_Soldier_Medic", "USMC_Soldier_AT","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier"];
      };

      case "Heavy AA":
      {
         mando_support_infantrytype_re = ["USMC_Soldier_TL", "USMC_Soldier_Medic", "USMC_Soldier_AA","USMC_Soldier_AA","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier"];
      };

      case "Heavy MG":
      {
         mando_support_infantrytype_re = ["USMC_Soldier_TL", "USMC_Soldier_Medic", "USMC_Soldier_MG","USMC_Soldier_MG","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier"];
      };

      case "Engineers":
      {
         mando_support_infantrytype_re = ["USMC_Soldier_TL", "USMC_Soldier_Medic", "USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer"];
      };
   };
};


mando_airsupport_opt3_text = "Vehicle supply type";
mando_airsupport_opt3_array = ["HMMWV", "M119"];
mando_airsupport_opt3_action = 
{
   private["_item"];
   _item = _this select 0;
   mando_airsupport_type_vehicle = _item;
};


mando_airsupport_opt4_text = "Ammo supply options";
mando_airsupport_opt4_array = ["Normal west", "Silenced","Heavy AT"];
mando_airsupport_opt4_action = 
{
   private["_item"];
   _item = _this select 0;
   switch (_item) do
   {
      case "Normal west":
      {
         mando_airsupport_magz = [];
         mando_airsupport_weap = [];
      };

      case "Silenced":
      {
         mando_airsupport_magz = [["30Rnd_556x45_StanagSD", 20],["15Rnd_9x19_M9SD", 20]];
         mando_airsupport_weap = [["M4A1_AIM_SD_camo", 10],["M9SD", 10]];
      };

      case "Heavy AT":
      {
         mando_airsupport_magz = [["Javelin", 3],["M136",9]];
         mando_airsupport_weap = [["Javelin", 3],["M136",3]];
      };
   }; 
};

// End of options setup dialog configuration



// Carpet bombing custom code global variable for AV8B
mando_airsupport_carpetcode = 
{
   private["_plane", "_targetpos", "_widx"];
   _plane = _this select 0;
   _targetpos = _this select 1;
   while {(([getPos _plane select 0, getPos _plane select 1, 0] distance _targetpos) > 2000) && (alive _plane)} do
   {
      Sleep 1;
   };

   if (alive _plane) then
   {
      _widx = [_plane, "BombLauncher"] call mando_weaponindex;
      for [{_i=0}, {_i<6}, {_i=_i+1}] do
      {
         _plane action ["useWeapon",_plane,driver _plane, _widx];
         Sleep 0.4;
      };
   };
};


["MMA Air Support Console", {((player hasWeapon "ACE_PRC119") || (player hasWeapon "ACE_PRC119_MAR") || (player hasWeapon "ACE_PRC119_ACU"))}]execVM "mando_missiles\mando_bombs\mando_giveme_console.sqf";

