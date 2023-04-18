#Requires AutoHotkey v2.0

; Para achar o Microfone tive que rodar o soundcard.ahk que lista todos os componentes

; Shift + F13 = Abaixa o volume do Microfone em - 1
+F13::SoundSetVolume "-1", , 12 ; "Mic Headset (2-GAMDIAS GAMING HEADSET)"

; Shift + F14 = Muta ou desmuta o Microfone
+F14::SoundSetMute -1, , 12 ; "Mic Headset (2-GAMDIAS GAMING HEADSET)"

; Shift + F15 = Aumenta o Volume do Microfone em + 1
+F15::SoundSetVolume "+1", , 12 ; "Mic Headset (2-GAMDIAS GAMING HEADSET)"