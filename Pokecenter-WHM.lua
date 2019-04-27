require('Modes')
require('Mote-Mappings')
require('GUI')
require('DualWieldCalc')

function setup()
	AccuracyMode = M{['description']='Accuracy Mode', 'Normal', 'Mid', 'High'}
	
	WeaponMode = M{['description']='Weapon', 'Auto', 'Kaja Rod', 'Yagrush', 'Mjollnir', 'Tishtrya', 'Kaja Staff'}
	Offhand = M{['description']='Offhand', 'Sindri', 'Izcalli', 'Ukaldi', 'Genmei Shield', 'Niobid Strap', 'Ammurapi Shield'}
	
	EngagedMode = M{['description']='Engaged Mode', 'Normal', 'Hybrid', 'DT'}
	IdleMode = M{['description']='Idle Mode', 'Refresh', 'DT', 'Meva'}
	
	DWMode = M{['description']='Dual Wield Mode', 'Auto', 'Manual'}
	DWLevel = M{['description']='Dual Wield Level','0', '9', '11', '15', '21', '25'}
	UseDW = player.sub_job == 'NIN' or player.sub_job == 'DNC'
	
	CursnaMode = M{['description']='Cursna Mode', 'AoE', 'Single Target'}
	
	Obi_WS = T{
		'Flash Nova',
		'Cataclysm'
	}
	
	WeaponTable = {
		['Auto'] = {img='WHM/Auto.png', type='Auto'},
		['Kaja Rod'] = {main="Kaja Rod", img='WHM/Kaja Rod.png', type='1H'},
		['Yagrush'] = {main="Yagrush", img='WHM/Yagrush.png', type='1H'},
		['Mjollnir'] = {main="Mjollnir", img='WHM/Mjollnir.png', type='1H'},
		['Kaja Staff'] = {main="Reikikon", img='WHM/Kaja Staff.png', type='2H'},
		['Tishtrya'] = {main="Tishtrya", img='WHM/Tishtrya.png', type='1H'},
	}
	
	OffhandTable = {
		['Sindri']={sub="Sindri", img='WHM/Sindri.png', type='Club', sort=1},
		['Izcalli']={sub="Izcalli", img='WHM/Izcalli.png', type='Club', sort=2},
		['Ukaldi']={sub="Ukaldi", img='WHM/Ukaldi.png', type='Club', sort=3},
		['Genmei Shield']={sub="Genmei Shield", img='WHM/Genmei Shield.png', type='Shield', sort=4},
		['Niobid Strap']={sub="Niobid Strap", img='WHM/Niobid Strap.png', type='Grip', sort=6},
		['Ammurapi Shield']={sub="Ammurapi Shield", img='WHM/Ammurapi Shield.png', type='Shield', sort=5}
	}
	
	selfCommandMaps = {
		['set']		= function(arg) _G[arg[1]]:set(table.concat(table.slice(arg, 2, -1)," ")); update_gear() end,
		['toggle']	= function(arg) _G[arg[1]]:toggle(); update_gear() end,
		['cycle']	= function(arg) _G[arg[1]]:cycle(); update_gear() end,
		['cycleback']	= function(arg) _G[arg[1]]:cycleback(); update_gear() end,
		['update']	= update_gear,
	}
	
	
	
	offhandRules = {
		['1H'] = T{UseDW and 'Club' or 'dummy', 'Shield'},
		['2H'] = T{'Grip'},
	}
	
	build_GUI()
	bind_keys()
	DWLevel:set(tostring(get_dw_level()))
end

function get_sets()
	setup()
	require('WHM-%s-Gear':format(player.name))
	build_gearsets() -- needs to be in the player name gear file
end

function bind_keys()

end

function file_unload()

end

function build_GUI()
	GUI_pos = {}
	GUI_pos.x = 1000
	GUI_pos.y = 80
	
	EM = IconButton{
		x = GUI_pos.x + 0,
		y = GUI_pos.y + 0,
		var = EngagedMode,
		icons = {
			{img = 'DD Normal.png', value = 'Normal'},
			{img = 'DD Hybrid.png', value = 'Hybrid'},
			{img = 'Emergancy DT.png', value = 'DT'}
		},
		command = function() windower.send_command('gs c update') end
	}
	EM:draw()
	
	local wi = {}
	for i,v in ipairs(WeaponMode) do
		wi[i] = {img=WeaponTable[v].img, value=v}
	end
	old_type = WeaponTable[WeaponMode.value].type
	WM = IconButton{
		x = GUI_pos.x + 0,
		y = GUI_pos.y + 54,
		var = WeaponMode,
		icons = wi,
		command = function() 
			if WeaponTable[WeaponMode.value].type ~= old_type then
				local ohi = get_offhands()
				if ohi then
					OH:new_icons(ohi, Offhand)
					OH:enable()
					OH:show()
				else
					OH:disable()
					OH:hide()
				end
				old_type = WeaponTable[WeaponMode.value].type
			end
			windower.send_command('gs c update')
		end,			
	}
	WM:draw()
	
	OH = IconButton{
		x = GUI_pos.x + 0,
		y = GUI_pos.y + 54 * 2,
		var = Offhand,
		icons = get_offhands() or {img='Auto.png', value='Sindri'},
		command = function() windower.send_command('gs c update') end
	}
	OH:draw()
	OH:hide()
	
	AccDisplay = TextCycle{
		x = GUI_pos.x + 0,
		y = GUI_pos.y + 54 * 3,
		var = AccuracyMode,
		align = 'left',
		width = 112,
		command = 'gs c update'
	}
	AccDisplay:draw()
	
	IdleDisplay = TextCycle{
		x = GUI_pos.x + 0,
		y = GUI_pos.y + 54 * 3 + 32,
		var = IdleMode,
		align = 'left',
		width = 112,
		command = 'gs c update'
	}
	IdleDisplay:draw()
	
	HMDisplay = TextCycle{
		x = GUI_pos.x + 0,
		y = GUI_pos.y + 54 * 3 + 32 * 2,
		var = DWMode,
		align = 'left',
		width = 112,
		command = function() windower.send_command('gs c update') end,
		start_hidden = not UseDW,
		disabled = not UseDW
	}
	HMDisplay:draw()
	
	DWDisplay = TextCycle{
		x = GUI_pos.x + 0,
		y = GUI_pos.y + 54 * 3 + 32 * 3,
		var = DWLevel,
		align = 'left',
		width = 112,
		command = function() DWMode:set('Manual'); windower.send_command('gs c update') end,
		start_hidden = not UseDW,
		disabled = not UseDW
	}
	DWDisplay:draw()
	
end

function self_command(commandArgs)
	local commandArgs = commandArgs
	if type(commandArgs) == 'string' then
		commandArgs = T(commandArgs:split(' '))
		if #commandArgs == 0 then
			return
		end
	end
	local handleCmd = table.remove(commandArgs, 1)
	if selfCommandMaps[handleCmd] then
		selfCommandMaps[handleCmd](commandArgs)
	end	
end

function get_offhands()
	local main = WeaponTable[WeaponMode.value]
	if main.type == 'Auto' then return end -- return nil
	local result = T{}
	local mresult = T{}
	local sort = T{}
	for k, v in pairs(OffhandTable) do
		if offhandRules[main.type]:contains(v.type) then
			result:append({value=k, img=v.img, sort=v.sort})
			mresult:append(k)
		end
	end
	--print(tostring(mresult))
	result = table.sort(result, function(a, b) return a.sort < b.sort end)
	Offhand = M{['description']='Offhand', table.unpack(mresult)}
	return result
end

function get_weapons()
	if WeaponMode.value ~= 'Auto' then
		return set_combine(WeaponMode.value, Offhand.value)
	else
		return {}
	end	
end

function get_idle_set()
    local dw_level = get_dw_level()
    if dw_level ~= DWLevel.value and DWMode.value == 'Auto' then
        DWLevel:set(tostring(dw_level))
    end
    
    local equipset = sets.Idle[IdleMode.value]
    if player.mpp < 50 then
        equipset = set_combine(equipset, sets.Fucho)
    end
    return set_combine(equipset, get_weapons())    
end

function get_engaged_set()
    local equipset = sets.engaged
    if equipset[EngagedMode.value] then
        equipset = equipset[EngagedMode.value]
    end
    if equipset[WeaponMode.value] then
        equipset = equipset[WeaponMode.value]
        if equipset[Offhand.value] then
            equipset = equipset[Offhand.value]
        end
    end
    if UseDW and OffhandTable[Offhand].type == 'Club' then
        local dw_level = get_dw_level()
        if dw_level ~= DWLevel.value and DWMode.value == 'Auto' then
            DWLevel:set(tostring(dw_level))
        end
        if equipset['DW'..DWLevel.value] then
            equipset = equipset['DW'..DWLevel.value]
        end
    end
    if equipset.AM3 and buffactive['Aftermath: Lv.3'] then
        equipset = equipset.AM3
    elseif equipset.AM and buffactive['Aftermath'] then
        equipset = equipset.AM
    end    
    for i=AccuracyMode.index, 1, -1 do -- start at currently selected mode, then step down until a set exists
        if equipset[AccuracyMode[i]] then
            equipset = equipset[AccuracyMode[i]]
            break
        end
    end
    equipset = set_combine(equipset, get_weapons())
    return equipset
end

function update_gear()	
	if player.status == 'Engaged' then
		equip(get_engaged_set())
	else
		equip(get_idle_set())
	end
end

function get_dw_level()
	local dw_needed = get_dw_needed()
	local dw_level = math.max(unpack(DWLevel))
	for i, dw in ipairs(DWLevel) do -- find the lowest dw that is >= dw_needed
		if tonumber(dw) < dw_level and tonumber(dw) >= dw_needed then
			dw_level = tonumber(dw)
		end
	end
	return dw_level
end

function pretarget(spell)
	if spell.type == 'WeaponSkill' then
		if player.tp < 1000 or buffactive['Stun'] or buffactive['Terror'] or buffactive['Amnesia'] or buffactive['Sleep'] or buffactive['Petrification'] then
			cancel_spell()
		end
	end
end

function custom_map(spell, map)
    if spell.action_type == 'Magic' then
        if map == 'Cure' and buffactive['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        elseif spell.name:contains('Boost') then
            return 'Boost'
        else
            return ''
        end
    end
end

function precast(spell, action)
	local map = spell_maps[spell.name]
	map = custom_map(spell, map)
	if spell.action_type == 'Magic' then
		local equipset = sets.precast
		if equipset[spell.name] then
			equipset = equipset[spell.name]
		elseif equipset[map] then
			equipset = equipset[map]
		elseif equipset[spell.skill] then
			equipset = equipset[spell.skill]
		end	
		if equipset[WeaponMode.value] then
			equipset = equipset[WeaponMode.value]
			if equipset[Offhand.value] then
				equipset = equipset[Offhand.value]
			end
		end
		if equipset[player.sub_job] then
			equipset = equipset[player.sub_job]
		end
		if buffactive['Light Arts'] and equipset.LightArts then
			equipset = equipset.LightArts
		elseif buffactive['Dark Arts'] and equipset.DarkArts then
			equipset = equipset.DarkArts
		end
		equip(set_combine(equipset, get_weapons()))
	elseif spell.type == 'WeaponSkill' then
		local equipset = sets.WS
			if equipset[spell.name] then
				equipset = equipset[spell.name]
			end
			if equipset[WeaponMode.value] then
				equipset = equipset[WeaponMode.value]
			end
			if equipset[Offhand.value] then
				equipset = equipset[Offhand.value]
			end
    if equipset.TP then -- sets.WS['Impulse Drive'].TP[2000].Mid will be used when over 2000 TP
        local t = 1000
        local use_tp_set = false
        for tp, set in ipairs(equipset.TP) do
            if tp > t and player.tp + (buffactive['warcry'] and 500 or 0) > tp then
                 t = tp
                 use_tp_set = true
             end
        end
            if use_tp_set then
                equipset = equipset.TP[tp]
            end
		end
    if equipset.AM3 and buffactive['Aftermath: Lv.3'] then
            equipset = equipset.AM3
    elseif equipset.AM and buffactive['Aftermath'] then
            equipset = equipset.AM
		end    
    for i=AccuracyMode.index, 1, -1 do -- start at currently selected mode, then step down until a set exists
        if equipset[AccuracyMode[i]] then
             equipset = equipset[AccuracyMode[i]]
             break
         end
    end
        if Obi_WS:contains(spell.name) and (world.weather_element == spell.element or
                                            world.day_element == spell.element ) then
            equipset = set_combine(equipset, sets.Obi)
        end
        equip(equipset)
	elseif spell.name:contains('Waltz') then
		equip(sets.JA.Waltz)
	elseif spell.name:contains( 'Step') then
		equip(sets.JA.Step)
	elseif spell.type == 'JobAbility' then
		if sets.JA[spell.name] then
			equip(sets.JA[spell.name])
		end
	end
end

function midcast(spell, action)
	local map = spell_maps[spell.name]
	map = custom_map(spell, map)
	if spell.action_type == 'Magic' then
		local equipset = sets.midcast
		if equipset[spell.name] then
			equipset = equipset[spell.name]			
		elseif equipset[map] then
			equipset = equipset[map]
		elseif equipset[spell.skill] then
			equipset = equipset[spell.skill]
		end
		if equipset[WeaponMode.value] then
			equipset = equipset[WeaponMode.value]
			if equipset[Offhand.value] then
				equipset = equipset[Offhand.value]
			end
		end
		if UseDW and equipset.DW then
			equipset = equipset.DW -- will usually be sets.midcast.Cursna.DW or sets.midcast.Cursna.Auto.DW
		end
		if spell.name == 'Cursna' then
			if equipset[CursnaMode.value] then
				equipset = equipset[CursnaMode.value]
			end
		end		
		if buffactive['Divine Caress'] and equipset.DivineCaress then
			equipset = equipset.DivineCaress
		end
		if equipset[player.sub_job] then
			equipset = equipset[player.sub_job]
		end
		if buffactive['Light Arts'] and equipset.LightArts then
			equipset = equipset.LightArts
		elseif buffactive['Dark Arts'] and equipset.DarkArts then
			equipset = equipset.DarkArts
		end
		equip(set_combine(equipset, get_weapons()))
	end
end

function aftercast(spell, action)
	update_gear()
end

function status_change(new, action)
	update_gear()
end

function buff_change(buff, gain)
	if buff == 'Haste' and not gain then
		Haste_Level = 0
	end
	local dw_level = get_dw_level()
	if dw_level ~= DWLevel.value then
		DWLevel:set(tostring(dw_level))
		update_gear()
	end
end

