class XGAIPlayer_PatrolWhenRevealed extends XGAIPlayer;

// Update - green alert units should do their patrol movement.
function bool ShouldUnitPatrol( XComGameState_Unit UnitState )
{
	if( IsMindControlled(UnitState) )
	{
		return false;
	}

	if( !IsScampering(UnitState.ObjectID) )
	{
		// Only leaders direct movement in patrols
		if( UnitState.GetGroupMembership().m_arrMembers[0].ObjectID == UnitState.ObjectID )
		{
			return true;
		}
	}

	return false;
}