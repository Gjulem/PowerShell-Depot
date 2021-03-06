# An example for copying a source folder to one or more destination systems

$folderPath = 'E:\drivers'
$computers = Import-CSV E:\computers.csv
ForEach($computer in $computers){
    New-PSDrive -Name Z -Root ("\\" + $computer.name + '\C$') -PSProvider FileSystem
    Copy-Item -Path $folderPath -Recurse -Force -Destination Z:\
    Remove-PSDrive -Name Z -Force
}
