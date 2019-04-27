function build_gearsets()

-------------------------------------------------------------------------
---------------------------Idle Sets-------------------------------------
-------------------------------------------------------------------------

-- Base Idle set, not used but often combined.
   sets.Idle =  {
    main="Bolelabunga",  -- 1 Regen/ Refresh
    sub="Genmei Shield", -- 10 PD
    ammo="Staunch Tathlum", -- 2 DT / +10 Resist Ailments
    head="Inyanga Tiara +2", -- 5 MDT 1 Refresh
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}}, -- 3 Refresh
    hands="Inyan. Dastanas +2", -- 4 MDT  1 Refresh
    legs="Assid. Pants +1", -- 1~2 Refresh
    feet="Inyan. Crackows +2", -- 3 MDT 1 Refresh
    neck="Loricate Torque +1", -- 6 DT
    waist="Fucho-no-Obi", 
    left_ear="Thureous Earring",
    right_ear="Etiolation Earring", -- 15 Resist Silence 3 MDT
    left_ring="Inyanga Ring", -- 2 MDT
    right_ring="Warden's Ring", -- 3 PDT
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}}, -- 10 PDT
}


-- Refresh + 8~10 (+1 Refresh with Shamash, -1 Refresh with Staunch Upgrade
-- MDT - 50% with Shellra V (Capped with Defending Ring)
-- PDT - 31% ( +10 With Genbu shield and +7 With Defending ring, Shamash +10, +3 with Staunch)
-- +15 Resist Silence / Charm


---Where Idle sets are specifically define---

sets.Idle.Refresh = sets.Idle
sets.Idle.DT = sets.Idle
sets.Idle.Meva = sets.Idle
sets.Fucho = {waist='Fucho-no-Obi'}

---- Magic Sets ----
-- Precast --
---Basic fast cast set---

sets.precast = {
    main= "Grioavolr", -- 10
    sub="Clerisy Strap", --2
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, --10
    body="Inyanga Jubbah +2", --14
    hands={ name="Chironic Gloves", augments={'Mag. Acc.+7','"Fast Cast"+5','"Mag.Atk.Bns."+12',}}, --5
    legs="Aya. Cosciales +2", -- 7
    feet="Regal Pumps +1", --7
    neck="Cleric's torque", --6
    waist="Witful Belt", --2
    left_ear="Etiolation Earring", --1
    right_ear="Nourish. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring", --2
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, --10
}

sets.precast.Cure = set_combine(sets.precast, {
	head="Piety Cap +2",
	legs="Ebers pantaloons +1",
	feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
})
sets.precast.StatusRemoval = set_combine(sets.precast, {legs="Ebers pantaloons +1"})
sets.precast['Enhancing Magic'] = set_combine(sets.precast, {waist='Siegal Sash'})
sets.precast['Stoneskin'] = set_combine(sets.precast, {head='Umuthi hat',waist='Siegal Sash'})
sets.precast.Utsusemi = set_combine(sets.precast, {neck='Magoraga Beads'})

-- Midcast --

--Abilities--
sets.JA = {}  -- Leave Blank, does nothing
sets.JA['Benediction'] = {body="Piety Briault +3"}
sets.JA['Devotion'] = {head="Piety Cap +2"} 
sets.JA['Martyr'] = {hands="Piety Mitts"}

sets.DivineCaress = {hands='Ebers Mitts', back='Mending Cape'} -- Will use this set when casting the -na when Divine Caress is up

sets.JA.Step = {   
	head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Telos Earring",
	left_ring="Ayanmo Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
--Need to find gear--
sets.JA.Waltz = {}


---Fast Recast set, not used only referenced. Good for Full cure and Raises---
sets.midcast = {} --Leave Blank shouldn't be used

sets.midcast.Recast = sets.precast

--Spell Interruption Set. Not used only referenced. Good for Raise and Teleport spells---

sets.midcast.SID = {
	hands='Chironic Gloves',
	feet='Theophany Duckbills +3',
}

--Midcast Cure Sets--

--Curing without a stance or under Misery
--Change to Theophany Briault when +3--
sets.midcast.Cure = {
    main="Chatoyant Staff", -- 10% + weather bonus
    sub="Reign Grip",
    ammo="Hydrocera", -- Pemphredo Tahlum
    head="Ebers Cap",-- Cure Potency +13% Bis: +1 Kaykaus
    body="Ebers Bliaud +1", -- Afflatus Solace +14
    hands="Theophany Mitts +2",
    legs="Ebers Pantaloons +1", -- 6% Cure Potency to Mana
    feet={ name="Kaykaus Boots", augments={'Mag. Acc.+15','"Cure" potency +5%','"Fast Cast"+3',}}, -- Cure Potency +15 % - Bis +1 Version
    neck="Cleric's Torque", -- 5% Cure Potency
    waist="Luminary Sash",
    left_ear="Glorious Earring", -- Cure Potency II +2 %
    right_ear="Nourish. Earring +1", -- Cure Potency +6 %
    left_ring="Sheltered Ring", -- BiS : Defending Ring
    right_ring="Prolix Ring", -- Bis : Janniston Ring
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
}

sets.midcast.Curaga = sets.midcast.Cure
sets.midcast.Cura = sets.midcast.Cure

sets.midcast['Full Cure'] = set_combine(sets.midcast.Recast, {body='Ebers Bliaud +1'})

--Afflatus Solace Cure set--
sets.midcast.CureSolace = {
    main="Chatoyant Staff", -- 10% + weather bonus
    sub="Reign Grip",
    ammo="Hydrocera", -- Pemphredo Tahlum
    head="Ebers Cap",-- Cure Potency +13% Bis: +1 Kaykaus
    body="Ebers Bliaud +1", -- Afflatus Solace +14
    hands="Theophany Mitts +2",
    legs="Ebers Pantaloons +1", -- 6% Cure Potency to Mana
    feet={ name="Kaykaus Boots", augments={'Mag. Acc.+15','"Cure" potency +5%','"Fast Cast"+3',}}, -- Cure Potency +15 % - Bis +1 Version
    neck="Cleric's Torque", -- 5% Cure Potency
    waist="Korin Obi",
    left_ear="Glorious Earring", -- Cure Potency II +2 %
    right_ear="Nourish. Earring +1", -- Cure Potency +6 %
    left_ring="Sheltered Ring", -- BiS : Defending Ring
    right_ring="Prolix Ring", -- Bis : Janniston Ring
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
}

--Weapon defined Curesets--
--Kaja Rod set is default for No cure potency mainhand. Just need to define Kaja sets and Mjollnir sets - rest link--

---------------------Define Me------------------------------------------------------------------------------------------
sets.midcast.Cure['Kaja Rod'] = set_combine( sets.midcast.Cure,{} )
sets.midcast.CureSolace['Kaja Rod'] = set_combine( sets.midcast.CureSolace,{} )
sets.midcast.Cure['Kaja Rod']['Izcalli'] = set_combine( sets.midcast.Cure,{} )
sets.midcast.CureSolace['Kaja Rod']['Izcalli'] = set_combine( sets.midcast.CureSolace,{} )

sets.midcast.Cure.Mjollnir = set_combine( sets.midcast.Cure,{} )
sets.midcast.CureSolace.Mjollnir = set_combine( sets.midcast.CureSolace,{} )
sets.midcast.Cure.Mjollnir.Izcalli = set_combine( sets.midcast.Cure,{} )
sets.midcast.CureSolace.Mjollnir.Izcalli = set_combine( sets.midcast.CureSolace,{} )
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
sets.midcast.Cure.Tishtrya = sets.midcast.Cure['Kaja Rod']
sets.midcast.CureSolace.Tishtrya = sets.midcast.CureSolace['Kaja Rod']
sets.midcast.Cure.Tishtrya.Izcalli = sets.midcast.Cure['Kaja Rod']['Izcalli']
sets.midcast.CureSolace.Tishtrya.Izcalli = sets.midcast.CureSolace['Kaja Rod']['Izcalli']

sets.midcast.Cure.Yagrush = sets.midcast.Cure['Kaja Rod']
sets.midcast.CureSolace.Yagrush = sets.midcast.CureSolace['Kaja Rod']
sets.midcast.Cure.Yagrush.Izcalli = sets.midcast.Cure['Kaja Rod']['Izcalli']
sets.midcast.CureSolace.Yagrush.Izcalli = sets.midcast.CureSolace['Kaja Rod']['Izcalli']

sets.midcast.Cure['Kaja Staff'] = sets.midcast.Cure['Kaja Rod']
sets.midcast.CureSolace['Kaja Staff'] = sets.midcast.CureSolace['Kaja Rod']


---------------------Define Me---------------------Weapon Curaga Sets---------------------------------------------------
sets.midcast.Curaga['Kaja Rod'] = set_combine( sets.midcast.Curaga,{} )
sets.midcast.Curaga['Kaja Rod']['Izcalli'] = set_combine( sets.midcast.Cure,{} )

sets.midcast.Curaga.Mjollnir = set_combine( sets.midcast.Curaga,{} )
sets.midcast.Curaga.Mjollnir.Izcalli = set_combine( sets.midcast.Cure,{} )
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


sets.midcast.Curaga.Tishtrya = sets.midcast.Curaga['Kaja Rod']
sets.midcast.Curaga.Tishtrya.Izcalli =sets.midcast.Curaga['Kaja Rod']['Izcalli']

sets.midcast.Curaga.Yagrush = sets.midcast.Curaga['Kaja Rod']
sets.midcast.Curaga.Yagrush.Izcalli =sets.midcast.Curaga['Kaja Rod']['Izcalli']

sets.midcast.Curaga['Kaja Staff'] = sets.midcast.Curaga['Kaja Rod']


---------------------Define Me----------------------Weapon Cura Sets--------------------------------------------------
sets.midcast.Cura['Kaja Rod'] = set_combine( sets.midcast.Cura,{} )
sets.midcast.Cura['Kaja Rod']['Izcalli'] = set_combine( sets.midcast.Cura,{} )

sets.midcast.Cura.Mjollnir = set_combine( sets.midcast.Cura,{} )
sets.midcast.Cura.Mjollnir.Izcalli = set_combine( sets.midcast.Cura,{} )
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------



sets.midcast.Cura.Tishtrya = sets.midcast.Cura['Kaja Rod']
sets.midcast.Cura.Tishtrya.Izcalli = sets.midcast.Cura['Kaja Rod']

sets.midcast.Cura.Yagrush = sets.midcast.Cura['Kaja Rod']
sets.midcast.Cura.Yagrush.Izcalli = sets.midcast.Cura['Kaja Rod']

sets.midcast.Cura['Kaja Staff'] = sets.midcast.Cura['Kaja Rod']




--Status Sets--

sets.midcast.StatusRemoval = set_combine(sets.midcast.recast, {
        head="Ebers Cap",
		legs="Ebers Pantaloons +1", 
		neck="Cleric's Torque"})

sets.midcast.StatusRemoval.DivineCaress = set_combine(sets.midcast.StatusRemoval, sets.DivineCaress)


sets.midcast.Cursna =  {
	main="Beneficus",
    sub="Sors Shield",
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaud +1",
    hands="Fanatic gloves",
    legs="Th. Pantaloons +3",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Debilis Medallion",
    waist="Luminary Sash",
    left_ear="Andoaa Earring",
    right_ear="Etiolation Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
}
sets.midcast.Cursna.DivineCaress = set_combine(sets.midcast.Cursna, sets.DivineCaress)

sets.midcast.Cursna['Single Target'] = sets.midcast.Cursna
sets.midcast.Cursna['Single Target'].DivineCaress = sets.midcast.Cursna.DivineCaress 
sets.midcast.Cursna['AoE'] = sets.midcast.Cursna
sets.midcast.Cursna['AoE'].DivineCaress = sets.midcast.Cursna.DivineCaress

--Enhancing Sets--

sets.midcast['Enhancing Magic'] = {
    main="Gada",
    sub="Ammurapi Shield",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +7',}},
    feet="Theo. Duckbills +3",
    neck="Melic Torque",
    left_ear="Andoaa Earring",
    right_ear="Gwati Earring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
}

sets.midcast['Protectra V'] = set_combine(sets.midcast['Enhancing Magic'], {feet='Piety duckbills+2'})
sets.midcast['Shellra V'] = set_combine(sets.midcast['Enhancing Magic'], {legs='Piety Pantaloons +1'})

sets.midcast.Boost = {
    main="Gada",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Theo. Duckbills +3",
    neck="Melic Torque",
    waist="Fucho-no-Obi",
    left_ear="Andoaa Earring",
    right_ear="Gwati Earring",
    left_ring="Inyanga Ring",
    right_ring="Ayanmo Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
}

sets.midcast.Boost.LightArts = {
    main="Gada",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands="Dynasty Mitts",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +7',}},
    feet="Theo. Duckbills +3",
    neck="Melic Torque",
    waist="Fucho-no-Obi",
    left_ear="Andoaa Earring",
    right_ear="Gwati Earring",
    left_ring="Inyanga Ring",
    right_ring="Ayanmo Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
}
sets.midcast.Boost['Kaja Rod'] = set_combine(sets.midcast.Boost, {head="Befouled Crown"})
sets.midcast.Boost.Mjollnir = sets.midcast.Boost['Kaja Rod']
sets.midcast.Boost.Tishtrya = sets.midcast.Boost['Kaja Rod']
sets.midcast.Boost.Yagrush = sets.midcast.Boost['Kaja Rod']
sets.midcast.Boost['Kaja Staff'] = sets.midcast.Boost['Kaja Rod']

sets.midcast.Boost['Kaja Rod'].LightArts = set_combine(sets.midcast.Boost.LightArts, {legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}}})
sets.midcast.Boost.Mjollnir.LightArts = sets.midcast.Boost['Kaja Rod']
sets.midcast.Boost.Tishtrya.LightArts = sets.midcast.Boost['Kaja Rod']
sets.midcast.Boost.Yagrush.LightArts = sets.midcast.Boost['Kaja Rod']
sets.midcast.Boost['Kaja Staff'].LightArts = sets.midcast.Boost['Kaja Rod']


sets.midcast.BarElement = { 
    main="Gada",
    sub="Ammurapi Shield",   
	head="Befouled Crown",
    body="Ebers Bliaud +1",
    hands="Inyan. Dastanas +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Ebers Duckbills",
    neck="Melic Torque",
    waist="Korin Obi",
    left_ear="Thureous Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Sheltered Ring",
    right_ring="Ayanmo Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

sets.midcast.BarElement.LightArts = {

    main="Beneficus",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Ebers Cap",
    body="Ebers Bliaud +1",
    hands="Ebers Mitts",
    legs={ name="Piety Pantaloons +1", augments={'Enhances "Shellra V" effect',}},
    feet="Ebers Duckbills",
    neck="Melic Torque",
    waist="Korin Obi",
    left_ear="Thureous Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Sheltered Ring",
    right_ring="Ayanmo Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

sets.midcast.BarElement['Kaja Rod'] = sets.midcast.BarElement
sets.midcast.BarElement.Mjollnir = sets.midcast.BarElement
sets.midcast.BarElement.Tishtrya = sets.midcast.BarElement
sets.midcast.BarElement.Yagrush = sets.midcast.BarElement
sets.midcast.BarElement['Kaja Staff'] = sets.midcast.BarElement

sets.midcast.BarElement['Kaja Rod'].LightArts = set_combine(sets.midcast.BarElement.LightArts, {head="Befoulder Crown"})
sets.midcast.BarElement.Mjollnir.LightArts = sets.midcast.BarElement['Kaja Rod']
sets.midcast.BarElement.Tishtrya.LightArts = sets.midcast.BarElement['Kaja Rod']
sets.midcast.BarElement.Yagrush.LightArts = sets.midcast.BarElement['Kaja Rod']
sets.midcast.BarElement['Kaja Staff'].LightArts = sets.midcast.BarElement['Kaja Rod']

sets.midcast.Regen = {  
	main="Bolelabunga",
    sub="Genmei Shield",
    head="Inyanga Tiara +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Ebers Mitts",
    legs="Th. Pantaloons +3",
    feet={ name="Telchine Pigaches", augments={'"Regen" potency+3',}},
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
}

sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist='Siegel Sash', neck='Nodens Gorget'})
sets.midcast.Phalanx = sets.midcast['Enhancing Magic']
sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet='Ebers Duckbills'})
sets.midcast.Utsusemi = sets.midcast.SID
sets.midcast.Klimaform = sets.midcast['Enhancing Magic']

--Additional Magic Sets--
--ConserveMP not used but references--
sets.ConserveMP = {
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Chironic Doublet",
    waist="Luminary Sash",
    left_ear="Gwati Earring",
    back="Solemnity Cape",
}

sets.midcast.Raise = set_combine(sets.midcast.Recast,sets.ConserveMP, sets.midcast.SID)
sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP, sets.midcast.SID)
sets.midcast.Teleport = sets.midcast.SID
sets.midcast.Warp = sets.midcast.SID


--Offensive Magic--

--Enfeebling--

sets.midcast['Enfeebling Magic'] = {   main="Gada",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Theophany Mitts +2",
    legs="Theophany Pantaloons +3",
    feet="Theo. Duckbills +3",
    neck="Imbodla Necklace",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Gwati Earring",
    left_ring="Kishar Ring",
    right_ring="Inyanga Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
} --Should never be used, can be referenced in other sets

sets.midcast.MndEnfeebles = sets.midcast['Enfeebling Magic']
sets.midcast.IntEnfeebles = sets.midcast['Enfeebling Magic']
sets.midcast['Repose'] = sets.midcast['Enfeebling Magic']
sets.midcast['Stun'] = sets.midcast['Enfeebling Magic']

--Magic Attack--

sets.midcast['Divine Magic'] = sets.midcast['Enfeebling Magic']
sets.midcast['Dark Magic'] = set_combine(sets.midcast['Divine Magic'],{waist="Fucho-no-Obi", left_ring="Evanescence Ring",right_ring="Excelsis Ring",})
sets.midcast['Elemental Magic'] = sets.midcast['Divine Magic']


--------Melee Sets-----------


--Engaged Sets--
--Base engaged set. Put non DW gear here, assumes Club / Shield
sets.engaged = {
    ammo="Homiliary",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
    feet="Aya. Gambieras +2",
    neck="Clotharius Torque",
    waist="Eschan Stone",
    left_ear="Telos Earring",
    right_ear="Regal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
} 
sets.engaged.Mid = set_combine(sets.engaged, {} )
sets.engaged.High = set_combine(sets.engaged, {} )

sets.engaged.AM3 = set_combine(sets.engaged, {} )
sets.engaged.AM3.Mid = set_combine(sets.engaged, {} )
sets.engaged.AM3.High = set_combine(sets.engaged, {} )

--Dual Wield Sets--

--Max Haste / Job ability Haste--
sets.engaged.DW0 = {
    ammo="Homiliary",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
    feet="Aya. Gambieras +2",
    neck="Clotharius Torque",
    waist="Eschan Stone",
    left_ear="Telos Earring",
    right_ear="Regal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
sets.engaged.DW0.Mid = set_combine(sets.engaged.DW0, {legs='Aya. Cosciales +2'} )
sets.engaged.DW0.High = set_combine(sets.engaged.DW0, {legs='Aya. Cosciales +2'} )

sets.engaged.DW0.AM3 = set_combine(sets.engaged.DW0, {} )
sets.engaged.DW0.AM3.Mid = set_combine(sets.engaged.DW0, {legs='Aya. Cosciales +2'} )
sets.engaged.DW0.AM3.High = set_combine(sets.engaged.DW0, {legs='Aya. Cosciales +2'} )


--DNC Sub--
--Haste Cap + Haste Samba I--
sets.engaged.DW9 = {
    ammo="Homiliary",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
    feet="Aya. Gambieras +2",
    neck="Clotharius Torque",
    waist="Shetal Stone",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

sets.engaged.DW9.Mid = set_combine(sets.engaged.DW9, {legs='Aya. Cosciales +2'} )
sets.engaged.DW9.High = set_combine(sets.engaged.DW9, {legs='Aya. Cosciales +2'} )

sets.engaged.DW9.AM3 = set_combine(sets.engaged.DW9, {} )
sets.engaged.DW9.AM3.Mid = set_combine(sets.engaged.DW9.AM3, {legs='Aya. Cosciales +2'} )
sets.engaged.DW9.AM3.High = set_combine(sets.engaged.DW9.AM3, {legs='Aya. Cosciales +2'} )

--Haste Cap + No Samba--
sets.engaged.DW21 = {
    ammo="Homiliary",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
    feet="Aya. Gambieras +2",
    neck="Clotharius Torque",
    waist="Shetal Stone",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

sets.engaged.DW21.Mid = set_combine(sets.engaged.DW21, {legs='Aya. Cosciales +2'} )
sets.engaged.DW21.High = set_combine(sets.engaged.DW21, {legs='Aya. Cosciales +2'} )

sets.engaged.DW21.AM3 = set_combine(sets.engaged.DW21, {} )
sets.engaged.DW21.AM3.Mid = set_combine(sets.engaged.DW21.AM3, {legs='Aya. Cosciales +2'} )
sets.engaged.DW21.AM3.High = set_combine(sets.engaged.DW21.AM3, {legs='Aya. Cosciales +2'} )

--NIN Sub--
--Haste Cap --
sets.engaged.DW11 = {
    ammo="Homiliary",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
    feet="Aya. Gambieras +2",
    neck="Clotharius Torque",
    waist="Shetal Stone",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
sets.engaged.DW11.Mid = set_combine(sets.engaged.DW11, {legs='Aya. Cosciales +2'} )
sets.engaged.DW11.High = set_combine(sets.engaged.DW11, {legs='Aya. Cosciales +2'} )

sets.engaged.DW11.AM3 = set_combine(sets.engaged.DW11, {} )
sets.engaged.DW11.AM3.Mid = set_combine(sets.engaged.DW11.AM3, {legs='Aya. Cosciales +2'} )
sets.engaged.DW11.AM3.High = set_combine(sets.engaged.DW11.AM3, {legs='Aya. Cosciales +2'} )


-- Low Haste --
sets.engaged.DW25 = {
    ammo="Homiliary",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
    feet="Aya. Gambieras +2",
    neck="Clotharius Torque",
    waist="Shetal Stone",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

sets.engaged.DW25.Mid = set_combine(sets.engaged.DW25, {legs='Aya. Cosciales +2'} )
sets.engaged.DW25.High = set_combine(sets.engaged.DW25, {legs='Aya. Cosciales +2'} )

sets.engaged.DW25.AM3 = set_combine(sets.engaged.DW25, {} )
sets.engaged.DW25.AM3.Mid = set_combine(sets.engaged.DW25.AM3, {legs='Aya. Cosciales +2'} )
sets.engaged.DW25.AM3.High = set_combine(sets.engaged.DW25.AM3, {legs='Aya. Cosciales +2'} )


--Staff Sets--

sets.engaged['Kaja Staff'] = sets.engaged
sets.engaged['Kaja Staff'].Mid = sets.engaged.Mid
sets.engaged['Kaja Staff'].High = sets.engaged.High


--Weapon Skill sets--

--Default WS Set--
sets.WS = {
		ammo="Hydrocera",
		head={ name="Piety Cap +2", augments={'Enhances "Devotion" effect',}},
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands="Inyan. Dastanas +2",
		legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
		feet={ name="Piety Duckbills +2", augments={'Enhances "Protectra V" effect',}},
		neck="Cleric's Torque",
		waist="Luminary Sash",
		right_ear="Ishvara Earring",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},		
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
sets.WS.TP = {} -- Definition, can leave blank
sets.WS.TP[2750] = set_combine(sets.WS,{left_ear='Regal Earring'})--No Moonshade
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS.Tishtrya = {}
sets.WS.Tishtrya.TP = {}
sets.WS.Ukaldi = {}
sets.WS.Ukaldi.TP = {}
sets.WS.Tishtrya.Ukaldi = {}
sets.WS.Tishtrya.Ukaldi.TP = {}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS.Tishtrya.TP[2250] = sets.WS.TP[2750] --No Moonshade Aeonic
sets.WS.Ukaldi.TP[1750] = sets.WS.TP[2750] -- No Moonshade / TP Bonus Empyrean
sets.WS.Tishtrya.Ukaldi.TP[1500] = sets.WS.TP[2750] -- No Moondshade / Aeonic / TP Bonus Empyrean
--Club Weapon Skills--

--Physical Scales with TP--
sets.WS['Black Halo'] = {
		ammo="Hydrocera",
		head={ name="Piety Cap +2", augments={'Enhances "Devotion" effect',}},
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands="Inyan. Dastanas +2",
		legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
		feet={ name="Piety Duckbills +2", augments={'Enhances "Protectra V" effect',}},
		neck="Cleric's Torque",
		waist="Luminary Sash",
		right_ear="Ishvara Earring",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},		
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Black Halo'].TP = {}
sets.WS['Black Halo'].Tishtrya = {}
sets.WS['Black Halo'].Tishtrya.TP = {}
sets.WS['Black Halo'].Ukaldi = {}
sets.WS['Black Halo'].Ukaldi.TP = {}
sets.WS['Black Halo'].Tishtrya.Ukaldi = {}
sets.WS['Black Halo'].Tishtrya.Ukaldi.TP = {}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Black Halo'].TP[2750] = set_combine(sets.WS['Black Halo'],{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Black Halo'].Tishtrya.TP[2250] = sets.WS['Black Halo'].TP[2750] --No Moonshade Aeonic
sets.WS['Black Halo'].Ukaldi.TP[1750] = sets.WS['Black Halo'].TP[2750] -- No Moonshade / TP Bonus Empyrean
sets.WS['Black Halo'].Tishtrya.Ukaldi.TP[1500] = sets.WS['Black Halo'].TP[2750] -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Black Halo'].Mid = sets.WS['Black Halo']
sets.WS['Black Halo'].TP[2750].Mid = set_combine(sets.WS['Black Halo'].Mid,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Black Halo'].Tishtrya.TP[2250].Mid = sets.WS['Black Halo'].Mid  --No Moonshade Aeonic
sets.WS['Black Halo'].Ukaldi.TP[1750].Mid = sets.WS['Black Halo'].Mid  -- No Moonshade / TP Bonus Empyrean
sets.WS['Black Halo'].Tishtrya.Ukaldi.TP[1500].Mid = sets.WS['Black Halo'].Mid  -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Black Halo'].High = sets.WS['Black Halo']
sets.WS['Black Halo'].TP[2750].High = set_combine(sets.WS['Black Halo'].High,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Black Halo'].Tishtrya.TP[2250].High = sets.WS['Black Halo'].TP[2750].High  --No Moonshade Aeonic
sets.WS['Black Halo'].Ukaldi.TP[1750].High = sets.WS['Black Halo'].TP[2750].High  -- No Moonshade / TP Bonus Empyrean
sets.WS['Black Halo'].Tishtrya.Ukaldi.TP[1500].High = sets.WS['Black Halo'].TP[2750].High -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Mystic Boon'] = {
		ammo="Hydrocera",
		head={ name="Piety Cap +2", augments={'Enhances "Devotion" effect',}},
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands="Inyan. Dastanas +2",
		legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
		feet={ name="Piety Duckbills +2", augments={'Enhances "Protectra V" effect',}},
		neck="Cleric's Torque",
		waist="Luminary Sash",
		right_ear="Ishvara Earring",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},		
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Mystic Boon'].TP = {}
sets.WS['Mystic Boon'].Tishtrya = {}
sets.WS['Mystic Boon'].Tishtrya.TP = {}
sets.WS['Mystic Boon'].Ukaldi = {}
sets.WS['Mystic Boon'].Ukaldi.TP = {}
sets.WS['Mystic Boon'].Tishtrya.Ukaldi = {}
sets.WS['Mystic Boon'].Tishtrya.Ukaldi.TP = {}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Mystic Boon'].TP[2750] = set_combine(sets.WS['Mystic Boon'],{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Mystic Boon'].Tishtrya.TP[2250] = sets.WS['Mystic Boon'].TP[2750] --No Moonshade Aeonic
sets.WS['Mystic Boon'].Ukaldi.TP[1750] = sets.WS['Mystic Boon'].TP[2750] -- No Moonshade / TP Bonus Empyrean
sets.WS['Mystic Boon'].Tishtrya.Ukaldi.TP[1500] = sets.WS['Mystic Boon'].TP[2750] -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Mystic Boon'].Mid = sets.WS['Mystic Boon']
sets.WS['Mystic Boon'].TP[2750].Mid = set_combine(sets.WS['Mystic Boon'].Mid ,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Mystic Boon'].Tishtrya.TP[2250].Mid = sets.WS['Mystic Boon'].TP[2750].Mid --No Moonshade Aeonic
sets.WS['Mystic Boon'].Ukaldi.TP[1750].Mid = sets.WS['Mystic Boon'].TP[2750].Mid -- No Moonshade / TP Bonus Empyrean
sets.WS['Mystic Boon'].Tishtrya.Ukaldi.TP[1500].Mid = sets.WS['Mystic Boon'].TP[2750].Mid -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Mystic Boon'].High = sets.WS['Mystic Boon']
sets.WS['Mystic Boon'].TP[2750].High = set_combine(sets.WS['Mystic Boon'].High,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Mystic Boon'].Tishtrya.TP[2250].High = sets.WS['Mystic Boon'].TP[2750].High --No Moonshade Aeonic
sets.WS['Mystic Boon'].Ukaldi.TP[1750].High = sets.WS['Mystic Boon'].TP[2750].High -- No Moonshade / TP Bonus Empyrean
sets.WS['Mystic Boon'].Tishtrya.Ukaldi.TP[1500].High = sets.WS['Mystic Boon'].TP[2750].High -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Judgment'] = {
		ammo="Hydrocera",
		head={ name="Piety Cap +2", augments={'Enhances "Devotion" effect',}},
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands="Inyan. Dastanas +2",
		legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
		feet={ name="Piety Duckbills +2", augments={'Enhances "Protectra V" effect',}},
		neck="Cleric's Torque",
		waist="Luminary Sash",
		right_ear="Ishvara Earring",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},		
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Judgment'].TP = {}
sets.WS['Judgment'].Tishtrya = {}
sets.WS['Judgment'].Tishtrya.TP = {}
sets.WS['Judgment'].Ukaldi = {}
sets.WS['Judgment'].Ukaldi.TP = {}
sets.WS['Judgment'].Tishtrya.Ukaldi = {}
sets.WS['Judgment'].Tishtrya.Ukaldi.TP = {}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Judgment'].TP[2750] = set_combine(sets.WS['Judgment'],{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Judgment'].Tishtrya.TP[2250] = sets.WS['Judgment'].TP[2750] --No Moonshade Aeonic
sets.WS['Judgment'].Ukaldi.TP[1750] = sets.WS['Judgment'].TP[2750] -- No Moonshade / TP Bonus Empyrean
sets.WS['Judgment'].Tishtrya.Ukaldi.TP[1500] = sets.WS['Judgment'].TP[2750] -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Judgment'].Mid = sets.WS['Judgment']
sets.WS['Judgment'].TP[2750].Mid = set_combine(sets.WS['Judgment'].Mid,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Judgment'].Tishtrya.TP[2250].Mid = sets.WS['Judgment'].TP[2750].Mid --No Moonshade Aeonic
sets.WS['Judgment'].Ukaldi.TP[1750].Mid = sets.WS['Judgment'].TP[2750].Mid -- No Moonshade / TP Bonus Empyrean
sets.WS['Judgment'].Tishtrya.Ukaldi.TP[1500].Mid = sets.WS['Judgment'].TP[2750].Mid -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Judgment'].High = sets.WS['Judgment']
sets.WS['Judgment'].TP[2750].High = set_combine(sets.WS['Judgment'].High,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Judgment'].Tishtrya.TP[2250].High = sets.WS['Judgment'].TP[2750].High --No Moonshade Aeonic
sets.WS['Judgment'].Ukaldi.TP[1750].High = sets.WS['Judgment'].TP[2750].High -- No Moonshade / TP Bonus Empyrean
sets.WS['Judgment'].Tishtrya.Ukaldi.TP[1500].High = sets.WS['Judgment'].TP[2750].High -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Hexa Strike'] = {
	
    head={ name="Piety Cap +2", augments={'Enhances "Devotion" effect',}},
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Aya. Manopolas +2",
    legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
    feet="Aya. Gambieras +2",
    neck="Light Gorget",
    waist="Light Belt",
    right_ear="Telos Earring",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Hexa Strike'].TP = {}
sets.WS['Hexa Strike'].Tishtrya = {}
sets.WS['Hexa Strike'].Tishtrya.TP = {}
sets.WS['Hexa Strike'].Ukaldi = {}
sets.WS['Hexa Strike'].Ukaldi.TP = {}
sets.WS['Hexa Strike'].Tishtrya.Ukaldi = {}
sets.WS['Hexa Strike'].Tishtrya.Ukaldi.TP = {}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Hexa Strike'].TP[2750] = set_combine(sets.WS['Hexa Strike'],{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Hexa Strike'].Tishtrya.TP[2250] = sets.WS['Hexa Strike'].TP[2750] --No Moonshade Aeonic
sets.WS['Hexa Strike'].Ukaldi.TP[1750] = sets.WS['Hexa Strike'].TP[2750] -- No Moonshade / TP Bonus Empyrean
sets.WS['Hexa Strike'].Tishtrya.Ukaldi.TP[1500] = sets.WS['Hexa Strike'].TP[2750]-- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Hexa Strike'].Mid = sets.WS['Hexa Strike']
sets.WS['Hexa Strike'].TP[2750].Mid = set_combine(sets.WS['Hexa Strike'].Mid,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Hexa Strike'].Tishtrya.TP[2250].Mid = sets.WS['Hexa Strike'].TP[2750].Mid  --No Moonshade Aeonic
sets.WS['Hexa Strike'].Ukaldi.TP[1750].Mid = sets.WS['Hexa Strike'].TP[2750].Mid  -- No Moonshade / TP Bonus Empyrean
sets.WS['Hexa Strike'].Tishtrya.Ukaldi.TP[1500].Mid = sets.WS['Hexa Strike'].TP[2750].Mid  -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Hexa Strike'].High = sets.WS['Hexa Strike']
sets.WS['Hexa Strike'].TP[2750].High = set_combine(sets.WS['Hexa Strike'].High,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Hexa Strike'].Tishtrya.TP[2250].High = sets.WS['Hexa Strike'].TP[2750].High --No Moonshade Aeonic
sets.WS['Hexa Strike'].Ukaldi.TP[1750].High = sets.WS['Hexa Strike'].TP[2750].High -- No Moonshade / TP Bonus Empyrean
sets.WS['Hexa Strike'].Tishtrya.Ukaldi.TP[1500].High = sets.WS['Hexa Strike'].TP[2750].High -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Realmrazer'] = {
	
    head={ name="Piety Cap +2", augments={'Enhances "Devotion" effect',}},
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Aya. Manopolas +2",
    legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
    feet={ name="Piety Duckbills +2", augments={'Enhances "Protectra V" effect',}},
    neck="Light Gorget",
    waist="Light Belt",
    right_ear="Telos Earring",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Realmrazer'].TP = {}
sets.WS['Realmrazer'].Tishtrya = {}
sets.WS['Realmrazer'].Tishtrya.TP = {}
sets.WS['Realmrazer'].Ukaldi = {}
sets.WS['Realmrazer'].Ukaldi.TP = {}
sets.WS['Realmrazer'].Tishtrya.Ukaldi = {}
sets.WS['Realmrazer'].Tishtrya.Ukaldi.TP = {}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Realmrazer'].TP[2750] = set_combine(sets.WS['Realmrazer'],{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Realmrazer'].Tishtrya.TP[2250] = sets.WS['Realmrazer'].TP[2750] --No Moonshade Aeonic
sets.WS['Realmrazer'].Ukaldi.TP[1750] = sets.WS['Realmrazer'].TP[2750] -- No Moonshade / TP Bonus Empyrean
sets.WS['Realmrazer'].Tishtrya.Ukaldi.TP[1500] = sets.WS['Realmrazer'].TP[2750] -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Realmrazer'].Mid = sets.WS['Realmrazer']
sets.WS['Realmrazer'].TP[2750].Mid = set_combine(sets.WS['Realmrazer'].Mid,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Realmrazer'].Tishtrya.TP[2250].Mid = sets.WS['Realmrazer'].TP[2750].Mid --No Moonshade Aeonic
sets.WS['Realmrazer'].Ukaldi.TP[1750].Mid = sets.WS['Realmrazer'].TP[2750].Mid -- No Moonshade / TP Bonus Empyrean
sets.WS['Realmrazer'].Tishtrya.Ukaldi.TP[1500].Mid = sets.WS['Realmrazer'].TP[2750].Mid -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Realmrazer'].High = sets.WS['Realmrazer']
sets.WS['Realmrazer'].TP[2750].High = set_combine(sets.WS['Realmrazer'].High,{left_ear='Regal Earring'}) --No Moonshade
sets.WS['Realmrazer'].Tishtrya.TP[2250].High = sets.WS['Realmrazer'].TP[2750].High --No Moonshade Aeonic
sets.WS['Realmrazer'].Ukaldi.TP[1750].High = sets.WS['Realmrazer'].TP[2750].High -- No Moonshade / TP Bonus Empyrean
sets.WS['Realmrazer'].Tishtrya.Ukaldi.TP[1500].High = sets.WS['Realmrazer'].TP[2750].High -- No Moondshade / Aeonic / TP Bonus Empyrean

sets.WS['Dagan'] = {    
	ammo="Staunch Tathlum",
    head={ name="Piety Cap +2", augments={'Enhances "Devotion" effect',}},
    body="Ebers Bliaud +1",
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
    legs="Th. Pant. +3",
    feet="Theo. Duckbills +3",
    neck="Sanctity Necklace",
    waist="Luminary Sash",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Etiolation Earring",
    left_ring="Ilabrat Ring",
    right_ring="Prolix Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Dagan'].TP = {}
sets.WS['Dagan'].Tishtrya = {}
sets.WS['Dagan'].Tishtrya.TP = {}
sets.WS['Dagan'].Ukaldi = {}
sets.WS['Dagan'].Ukaldi.TP = {}
sets.WS['Dagan'].Tishtrya.Ukaldi = {}
sets.WS['Dagan'].Tishtrya.Ukaldi.TP = {}
---------------------------------Defining sets. These aren't used------------------------------------------------
sets.WS['Dagan'].TP[2750] = set_combine(sets.WS['Dagan'],{left_ear='Thureous Earring'}) --No Moonshade
sets.WS['Dagan'].Tishtrya.TP[2250] = sets.WS['Dagan'].TP[2750]  --No Moonshade Aeonic
sets.WS['Dagan'].Ukaldi.TP[1750] = sets.WS['Dagan'].TP[2750]  -- No Moonshade / TP Bonus Empyrean
sets.WS['Dagan'].Tishtrya.Ukaldi.TP[1500] = sets.WS['Dagan'].TP[2750]  -- No Moondshade / Aeonic / TP Bonus Empyrean

--Magic Weaponskill--

sets.WS['Flash Nova'] = {
    ammo="Impatiens",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +1",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Cleric's Torque",
    waist="Witful Belt",
    left_ear="Moonshade Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Sheltered Ring",
    right_ring="Prolix Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
sets.WS['Flash Nova'].Mid = set_combine( sets.WS['Flash Nova'] , {})
sets.WS['Flash Nova'].High = set_combine( sets.WS['Flash Nova'] , {})

--Doesn't Scale with TP--

sets.WS['Randgrith'] = {}
sets.WS['Randgrith'].Mid = set_combine(sets.WS['Randgrith']  , {})
sets.WS['Randgrith'].High = set_combine(sets.WS['Randgrith']  , {})

--Utility (High Macc)--

sets.WS['Brainshaker'] = {
	ammo="Staunch Tathlum",
    head="Aya. Zucchetto +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet={ name="Piety Duckbills +2", augments={'Enhances "Protectra V" effect',}},
    neck="Sanctity Necklace",
    waist="Luminary Sash",
    right_ear="Telos Earring",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Ayanmo Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}



--Staff Weapon Skills--

--Physical Scales with TP--
sets.WS['Shattersoul'] = {
	
    head={ name="Piety Cap +2", augments={'Enhances "Devotion" effect',}},
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Aya. Manopolas +2",
    legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
    feet={ name="Piety Duckbills +2", augments={'Enhances "Protectra V" effect',}},
    neck="Light Gorget",
    waist="Light Belt",
    right_ear="Telos Earring",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
sets.WS['Shattersoul'].TP = {}
sets.WS['Shattersoul'].TP[2750] = set_combine(sets.WS['Shattersoul'],{left_ear='Regal Earring'}) --No Moonshade

sets.WS['Shattersoul'].Mid = set_combine(sets.WS['Shattersoul'], {})
sets.WS['Shattersoul'].TP[2750].Mid = set_combine(sets.WS['Shattersoul'],{left_ear='Regal Earring'}) --No Moonshade

sets.WS['Shattersoul'].High = set_combine(sets.WS['Shattersoul'], {})
sets.WS['Shattersoul'].TP[2750].High = set_combine(sets.WS['Shattersoul'],{left_ear='Regal Earring'}) --No Moonshade

sets.WS['Retribution'] = {
		ammo="Hydrocera",
		head={ name="Piety Cap +2", augments={'Enhances "Devotion" effect',}},
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands="Inyan. Dastanas +2",
		legs={ name="Telchine Braconi", augments={'Accuracy+12 Attack+12','"Store TP"+6','Weapon skill damage +3%',}},
		feet={ name="Piety Duckbills +2", augments={'Enhances "Protectra V" effect',}},
		neck="Cleric's Torque",
		waist="Luminary Sash",
		right_ear="Ishvara Earring",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},		
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
sets.WS['Retribution'].TP = {}
sets.WS['Retribution'].TP[2750] = set_combine(sets.WS['Retribution'],{left_ear='Regal Earring'}) --No Moonshade

sets.WS['Retribution'].Mid = set_combine(sets.WS['Retribution'], {})
sets.WS['Retribution'].TP[2750].High = set_combine(sets.WS['Retribution'],{left_ear='Regal Earring'}) --No Moonshade

sets.WS['Retribution'].Mid = set_combine(sets.WS['Retribution'], {})
sets.WS['Retribution'].TP[2750].High = set_combine(sets.WS['Retribution'],{left_ear='Regal Earring'}) --No Moonshade

--Magical Scales with TP--
sets.WS['Cataclysm'] = {
    ammo="Impatiens",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +1",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Cleric's Torque",
    waist="Witful Belt",
    left_ear="Moonshade Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Sheltered Ring",
    right_ring="Prolix Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
sets.WS['Cataclysm'].TP = {}
sets.WS['Cataclysm'].TP[2750] = set_combine(sets.WS['Cataclysm'],{left_ear='Regal Earring'}) --No Moonshade

--Utility (High Macc)--

sets.WS['Shell Crusher'] = {
	ammo="Staunch Tathlum",
    head="Aya. Zucchetto +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet={ name="Piety Duckbills +2", augments={'Enhances "Protectra V" effect',}},
    neck="Sanctity Necklace",
    waist="Luminary Sash",
    right_ear="Telos Earring",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Ayanmo Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}



end