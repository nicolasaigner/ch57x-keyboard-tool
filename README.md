# Agradecimentos

@kriomant por criar o software original. Estava com o mesmo problema que ele e esse abençoado criou isso e publicou no github. Muito Obrigado!

# Documentação completa

[Kriomant/ch57x-keyboard-tool](https://github.com/kriomant/ch57x-keyboard-tool)

Recomendo muito dar uma olhada, o cara fez um trabalho incrível.

# Como usei?

1. Baixei a relese no github do kriomant;
2. Peguei como exemplo o arquivo `example-mapping.yaml` e criei o meu `f13-f24-mapping.yaml`;
3. Rodei o comando pelo CMD (não pelo PowerShell, pelo CMD): `ch57x-keyboard-tool.exe validate < f13-f24-mapping.yaml` para validar a minha configuração;
4. Depois de receber o `config is valid 👌`, rodei o comando: `ch57x-keyboard-tool.exe upload < f13-f24-mapping.yaml` para escrever a configuração no teclado;
5. Verifiquei com o projeto keyboard-monitor se as teclas estavam funcionando. É em Python, então só rodar o main.py e clicar para ver o que acontece.

# Como funciona?

Na minha configuração eu tentei criar teclas extras, do F13 a F24, mas como tem 2 knobs, eu queria deixar um para controlar o volume de saída e outro de entrada.
Nesse caso, nas configurações do knobs, o knob 1, já tem a configuração de volume de saída, já o knob 2 usei com as teclas `shift+F13`, `shift+F14` e `shift+F15`;
Com isso, criei o arquivo do AutoHotKey para fazer o seguinte:

```ahk
#Requires AutoHotkey v2.0

; Para achar o Microfone tive que rodar o soundcard.ahk que lista todos os componentes

; Shift + F13 = Abaixa o volume do Microfone em - 1
+F13::SoundSetVolume "-1", , 12 ; "Mic Headset (2-GAMDIAS GAMING HEADSET)"

; Shift + F14 = Muta ou desmuta o Microfone
+F14::SoundSetMute -1, , 12 ; "Mic Headset (2-GAMDIAS GAMING HEADSET)"

; Shift + F15 = Aumenta o Volume do Microfone em + 1
+F15::SoundSetVolume "+1", , 12 ; "Mic Headset (2-GAMDIAS GAMING HEADSET)"
```

Para achar qual é o ID da placa de som, eu usei o [soundcard.ahk](https://www.autohotkey.com/docs/v2/lib/Sound.htm#Examples). Ao executar, ele lista todos os componentes de áudio e o ID de cada um.

# Conclusão 

Vou deixar esse repositório aqui como configurações extras do que eu fiz, caso algum dia eu formate o PC ou alguém tenha dúvida de como usar esse teclado, já que o vendedor do AliExpress só mandou um arquivo no Drive com o software original e a configuração é péssima. 