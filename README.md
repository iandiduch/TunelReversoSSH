# Proyecto de Automatización de Túneles SSH Persistentes para Acceder Remotamente a Dispositivos de la Red Local.

* Descripción
Este proyecto está diseñado para establecer y mantener conexiones de túneles SSH reversos, permitiendo el acceso remoto en este caso a cámaras de seguridad dentro de una red local. Utiliza scripts de PowerShell y archivos por lotes (batch) para automatizar la conexión SSH en sistemas operativos Windows. Muy util en casos que el proveedor (ISP) tenga a sus clientes en una red MAN, y asigne ip privadas, por lo cual no brinda una ip publica a cada cliente.

* Características
  - Túnel SSH Persistente: Configuración de túneles SSH inversos para redirigir puertos de una red local a un VPS.
  - Establecimiento Automático de Conexiones SSH: Utiliza un script de PowerShell para iniciar y mantener la conexión SSH a un servidor remoto.
  - Reconexión Automática: Si la conexión SSH se pierde, el script de PowerShell intenta restablecerla automáticamente.
  - Ejecución al Iniciar el Sistema: Una tarea programada en Windows garantiza que la conexión SSH se establezca automáticamente al iniciar el sistema, sin necesidad de intervención del 
  usuario.
  - Ejecución en Segundo Plano: Utilización de un script .vbs para ejecutar los scripts sin mostrar la ventana del cmd.

* Requisitos
Sistema Operativo: Windows 7 o superior.
Servidor VPS: Un servidor remoto accesible para establecer el túnel SSH, funcionara como intermediario. En este caso se utilizo AWS EC2.

* Instrucciones de Instalación
  1. Clonar el repositorio.
  2. Configurar la conexion al vps, y la ip local con sus puertos a redirigir en el archivo reconnect.ps1
  3. Crear una tarea programada para ejecutar al inicio del sistema el achivo .vbs, o segun nuestros requerimientos.

* Estructura del Proyecto
  - reconnect.ps1: Script de PowerShell que establece y mantiene la conexión SSH. Dentro de el se modificara las opciones de conexion segun nuestros requerimientos.
  - iniciar.bat: Archivo por lotes que inicia el script de PowerShell.
  - iniciar.vbs: Script VBS que ejecuta el archivo batch sin mostrar la ventana del cmd.

* Uso
Una vez programada la tarea, el sistema establecerá automáticamente el túnel SSH al iniciar Windows. Para probar manualmente la conexión, puede ejecutar iniciar.bat.
Ahora podra acceder remotamente a un dispositivo conectado a la red local, como por ejemplo una camara de seguridad a traves de un celular. Para esto tendra que descargar alguna aplicacion ssh que soporte Port Forwarding como Termius y redirigir el puerto correspondiente del vps a su localhost, luego desde cualquier parte del mundo podra acceder a su dispositivo que se encuentra en la red local.
