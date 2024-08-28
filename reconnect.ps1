# Ruta al ejecutable SSH (ssh.exe) en el sistema
$sshPath = "C:\Windows\System32\OpenSSH\ssh.exe"

# Ruta al archivo de clave
$keyPath = ""

# Configuración de la conexión SSH
$sshHost = "ip"
$sshUser = "usuario"
$sshOptions = "-R 8001:ipLocal:8001 -R 8002:ipLocal:8002 -R 8003:ipLocal:8003 -R 8004:ipLocal:8004 -i $keyPath -o ServerAliveInterval=60 -o ServerAliveCountMax=10"

# Función para iniciar la conexión SSH usando ssh.exe
function Start-SSHConnection {
    while ($true) {
        # Comando para ejecutar SSH con las opciones
        Start-Process -FilePath $sshPath -ArgumentList "$sshUser@$sshHost $sshOptions" -NoNewWindow -Wait
        
        # Verificar el error y reconectar si es necesario
        if ($LASTEXITCODE -ne 0) {
            Write-Output "Conexión fallida. Reintentando en 10 segundos..."
            Start-Sleep -Seconds 10
        }
    }
}

# Ejecutar la función para iniciar la conexión
Start-SSHConnection
