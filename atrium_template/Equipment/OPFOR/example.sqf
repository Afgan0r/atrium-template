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

_this addWeapon 'rhs_weap_ak74m_gp25';
_this addPrimaryWeaponItem 'rhs_acc_dtk';
_this addPrimaryWeaponItem 'rhs_acc_1p78';
_this addPrimaryWeaponItem 'rhs_30Rnd_545x39_7N10_plum_AK';
_this addPrimaryWeaponItem 'rhs_VOG25';

_this addWeapon 'rhs_weap_rpg26';
_this addSecondaryWeaponItem 'rhs_rpg26_mag';

_this addWeapon 'rhs_weap_makarov_pm';
_this addHandgunItem 'rhs_mag_9x18_8_57N181S';

_this forceAddUniform 'rhs_uniform_emr_patchless';

_this addVest 'rhs_6b45_off';
for '_i' from 1 to 8 do { _this addItemToVest 'rhs_30Rnd_545x39_7N10_plum_AK';};
for '_i' from 1 to 2 do { _this addItemToVest 'rhs_30Rnd_545x39_AK_plum_green';};
for '_i' from 1 to 2 do { _this addItemToVest 'rhs_mag_rdg2_white';};
for '_i' from 1 to 2 do { _this addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 3 do { _this addItemToVest 'rhs_mag_9x18_8_57N181S';};

_this addBackpack 'rhs_rd54_emr1';
for '_i' from 1 to 10 do { _this addItemToBackpack  'rhs_VOG25';};
for '_i' from 1 to 5 do { _this addItemToBackpack  'rhs_VOG25P';};
for '_i' from 1 to 5 do { _this addItemToBackpack  'rhs_GRD40_White';};

_this addHeadgear 'rhs_6b27m_green';
_this addGoggles 'rhs_balaclava1_olive';

_this linkItem 'ItemMap';
_this linkItem 'ItemCompass';
_this linkItem 'tf_microdagr';
_this linkItem 'tf_fadak';
_this linkItem 'ItemGPS';
_this addWeapon 'rhs_1PN138';
_this addWeapon 'rhs_pdu4';
