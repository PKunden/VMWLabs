PS C:\Users\Administrator.CORP> Get-WinUserLanguageList


LanguageTag     : en-US
Autonym         : English (United States)
EnglishName     : English
LocalizedName   : English (United States)
ScriptName      : Latin
InputMethodTips : { 0409:00000409, 0409:00000407 }
Spellchecking   : True
Handwriting     : False

<#
# you just need to add inputmethodtips. need to check this though.
# as of toda 10.06.2023 i do not need to do this as keyboard was automatically added.

  $Lang = New-WinUserLanguageList en-US #you cant add all language at time(of course you can piping it)
  $Lang.Add("de") #you must add it simple
  $Lang[2].InputMethodTips.Clear()
  $Lang[2].InputMethodTips.Add('0419:A0000419') # required layout
  Set-WinUserLanguageList -LanguageList $Lang #input must be in format System.Collections.Generic.List<Microsoft.InternationalSettings.Commands.WinUserLanguage>
#>