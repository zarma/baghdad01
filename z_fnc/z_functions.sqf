//////////////////////////////////////////////////////////////////
// Function file for Armed Assault 2
// Created by: =[A*C]= Z
//////////////////////////////////////////////////////////////////
// gestion d es messages
z_smsg = {
  	[playerSide,"HQ"] sideChat _this;
};

z_stock_info_object = {
    _object = _this select 0;
    
    _pos = getpos _object;
    _textC = "";
    {
    	_textC = _textC + _x;
    	} forEach z_posarray;
    copyToClipboard _textC;
};