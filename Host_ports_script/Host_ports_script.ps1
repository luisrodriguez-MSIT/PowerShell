﻿# Prompt for the destination host
$dhost = Read-Host "Enter the destination host"

# Prompt for the number of ports to test
$portCount = Read-Host "Enter the number of ports to test"

# Initialize an array to store the port numbers
$ports = @()

# Prompt for the port numbers to test
for ($i = 1; $i -le $portCount; $i++) {
    $port = Read-Host "Enter port $i"
    $ports += $port
}

# Test the connection to the destination on each of the specified ports
foreach ($port in $ports) {
    $connection = New-Object System.Net.Sockets.TcpClient
    try {
        $connection.Connect($dhost, $port)
        "Connection to port $port succeeded"
    } catch {
        "Connection to port $port failed"
    } finally {
        $connection.Dispose()
    }
}
