wasGuarding = {};
wasGuarding["start"] = 0;
function Guard_Update_kus_mothership (group, player_index, ship_id)

  

  if (wasGuarding[ship_id] == nil) then
    wasGuarding[ship_id] = 0;
  end

  if (SobGroup_GetCurrentOrder(group) == 9) then
    if (wasGuarding[ship_id] == 0) then
      --We've gone from not guarding to guarding
      --Therefore we set stance to passive
      if (SobGroup_GetROE(group) ~= 0) then -- but only if we're not set to aggressive
        SobGroup_SetROE(group, 2);
      end
    end
    wasGuarding[ship_id] = 1;
  end
  if (SobGroup_GetCurrentOrder(group) ~= 9) then
    if (wasGuarding[ship_id] == 1) then
      if (SobGroup_GetROE(group) ~= 0) then -- but only if we're not set to aggressive
        SobGroup_SetROE(group,1);
      end
    end
    wasGuarding[ship_id] = 0;
  end
end
