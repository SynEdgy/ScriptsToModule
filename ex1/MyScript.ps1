[datetime] $EventDate = '01/03/2023'
[string]   $Presenter = 'Gael'
[string]   $Subject   = 'how to work with PowerShell modules'

if ($EventDate -eq [datetime]::Today )
{
    Write-Host -Object ('Today the {0}, {1} shows "{2}"!' -f @(
            '{0:d.MM.yyyy}' -f $EventDate
            $Presenter
            $Subject
        )
    )
}
else
{
    Write-Host "It's not today!"
}
