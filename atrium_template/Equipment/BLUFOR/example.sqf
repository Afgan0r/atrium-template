// это пример того как должен выглядеть файл со снаряжением для юнита

if (not local _this) exitwith {};

removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

_this addWeapon 'rhs_weap_m4a1_blockII_M203_d';
_this addPrimaryWeaponItem 'BWA3_muzzle_snds_QDSS_tan';
_this addPrimaryWeaponItem 'rhsusf_acc_anpeq15side';
_this addPrimaryWeaponItem 'rhsusf_acc_su230a_mrds_c';
_this addPrimaryWeaponItem 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan';
_this addPrimaryWeaponItem 'rhs_mag_M441_HE';

_this addWeapon 'rhs_weap_M136';

_this addWeapon 'rhsusf_weap_glock17g4';
_this addHandgunItem 'mkk_hlc_muzzle_TiRant9';
_this addHandgunItem 'acc_flashlight_pistol';
_this addHandgunItem 'rhsusf_mag_17Rnd_9x19_FMJ';

_this forceAddUniform 'AGE_CryeG3_MCam';

_this addVest 'tfa_lbt_tl_mc';
for '_i' from 1 to 8 do { _this addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan';};
for '_i' from 1 to 2 do { _this addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red';};
for '_i' from 1 to 2 do { _this addItemToVest 'SmokeShell';};
for '_i' from 1 to 2 do { _this addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 3 do { _this addItemToVest 'rhsusf_mag_17Rnd_9x19_FMJ';};

_this addBackpack 'rhsusf_falconii_mc';
for '_i' from 1 to 10 do { _this addItemToBackpack  'rhs_mag_M441_HE';};
for '_i' from 1 to 5 do { _this addItemToBackpack  'rhs_mag_M433_HEDP';};
for '_i' from 1 to 5 do { _this addItemToBackpack  'rhs_mag_m714_White';};

_this addHeadgear 'rhsusf_opscore_mc';
_this addGoggles 'rhsusf_oakley_goggles_clr';

_this linkItem 'ItemMap';
_this linkItem 'ItemCompass';
_this linkItem 'ItemWatch';
_this linkItem 'rhsusf_radio_anprc152';
_this linkItem 'ItemGPS';
_this addWeapon 'rhsusf_ANPVS_15';
_this addWeapon 'Binocular';
