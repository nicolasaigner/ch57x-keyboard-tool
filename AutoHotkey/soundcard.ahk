scGui := Gui(, "Sound Components")
scLV := scGui.Add('ListView', "w600 h400"
    , ["Component", "#", "Device", "Volume", "Mute"])

devMap := Map()

loop
{
    ; For each loop iteration, try to get the corresponding device.
    try
        devName := SoundGetName(, dev := A_Index)
    catch  ; No more devices.
        break
    
    ; Qualify names with ":index" where needed.
    devName := Qualify(devName, devMap, dev)
    
    ; Retrieve master volume and mute setting, if possible.
    vol := mute := ""
    try vol := Round(SoundGetVolume( , dev), 2)
    try mute := SoundGetMute( , dev)
    
    ; Display the master settings only if at least one was retrieved.
    if vol != "" || mute != ""
        scLV.Add("", "", dev, devName, vol, mute)
    
    ; For each component, first query its name.
    cmpMap := Map()
    
    loop
    {
        try
            cmpName := SoundGetName(cmp := A_Index, dev)
        catch
            break
        ; Retrieve this component's volume and mute setting, if possible.
        vol := mute := ""
        try vol := Round(SoundGetVolume(cmp, dev), 2)
        try mute := SoundGetMute(cmp, dev)
        ; Display this component even if it does not support volume or mute,
        ; since it likely supports other controls via SoundGetInterface().
        scLV.Add("", Qualify(cmpName, cmpMap, A_Index), dev, devName, vol, mute)
    }
}

loop 5
    scLV.ModifyCol(A_Index, 'AutoHdr Logical')
scGui.Show()

; Qualifies full names with ":index" when needed.
Qualify(name, names, overallIndex)
{
    if name = ''
        return overallIndex
    key := StrLower(name)
    index := names.Has(key) ? ++names[key] : (names[key] := 1)
    return (index > 1 || InStr(name, ':') || IsInteger(name)) ? name ':' index : name
}