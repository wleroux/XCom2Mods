//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XComTacticalInput_LW extends XComTacticalInput dependson(X2GameRuleset) config(TacticalInput_LW);

var config float CAMERA_ROTATION_DEG;

state InReplayPlayback
{
	function bool DPad_Right( int ActionMask )
	{
		if (( ActionMask & class'UIUtilities_Input'.const.FXS_ACTION_RELEASE) != 0)
			XComTacticalController(Outer).YawCamera(-CAMERA_ROTATION_DEG);
		return false;
	}

	function bool DPad_Left( int ActionMask )
	{
		if (( ActionMask & class'UIUtilities_Input'.const.FXS_ACTION_RELEASE) != 0)
			XComTacticalController(Outer).YawCamera(CAMERA_ROTATION_DEG);
		return false;
	}
}

state UsingTargetingMethod
{
	function bool DPad_Right( int ActionMask )
	{
		if (( ActionMask & class'UIUtilities_Input'.const.FXS_ACTION_PRESS) != 0)
		{
			XComTacticalController(Outer).YawCamera(-CAMERA_ROTATION_DEG);
		}
		return true;
	}

	function bool DPad_Left( int ActionMask )
	{
		if (( ActionMask & class'UIUtilities_Input'.const.FXS_ACTION_PRESS) != 0)
		{
			XComTacticalController(Outer).YawCamera(CAMERA_ROTATION_DEG);
		}
		return true;
	}
}

state Multiplayer_Inactive
{
	function bool DPad_Right( int ActionMask )
	{
		if (( ActionMask & class'UIUtilities_Input'.const.FXS_ACTION_RELEASE) != 0)
			XComTacticalController(Outer).YawCamera(-CAMERA_ROTATION_DEG);
		return false;
	}
	function bool DPad_Left( int ActionMask )
	{
		if (( ActionMask & class'UIUtilities_Input'.const.FXS_ACTION_RELEASE) != 0)
			XComTacticalController(Outer).YawCamera(CAMERA_ROTATION_DEG);
		return false;
	}
}

state ActiveUnit_Moving
{
	function bool DPad_Right( int ActionMask )
	{
		`Log("XComTacticalInput_LW: ActiveUnit_Moving, Right");
		if (( ActionMask & class'UIUtilities_Input'.const.FXS_ACTION_RELEASE) != 0)
			XComTacticalController(Outer).YawCamera(-CAMERA_ROTATION_DEG);
		return false;
	}
	function bool DPad_Left( int ActionMask )
	{
		if (( ActionMask & class'UIUtilities_Input'.const.FXS_ACTION_RELEASE) != 0)
			XComTacticalController(Outer).YawCamera(CAMERA_ROTATION_DEG);
		return false;
	}
}