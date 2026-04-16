# LIRA - Script de renombrado de imágenes
# Ejecutar con clic derecho > "Ejecutar con PowerShell"
# Debe estar en la misma carpeta lira-web

$carpeta = Split-Path -Parent $MyInvocation.MyCommand.Path

$renombrar = @{
    # Abadías
    "CF_MURO TV 2+.jpg"     = "CF_MURO_TV_2_.jpg"
    "CF_MURO TV 2.jpg"      = "CF_MURO_TV_2.jpg"
    "CF_MURO TV 1_2.jpg"    = "CF_MURO_TV_1_2.jpg"
    "CF_MURO TV 1.jpg"      = "CF_MURO_TV_1.jpg"

    # Terrarium
    "1 SALA A OK.jpg"       = "1_SALA_A_OK.jpg"
    "1 SALA B OK.jpg"       = "1_SALA_B_OK.jpg"
    "3 SALA COMEDOR A.jpg"  = "3_SALA_COMEDOR_A.jpg"
    "3 SALA COMEDOR B.jpg"  = "3_SALA_COMEDOR_B.jpg"
    "4 HAB A.jpg"           = "4_HAB_A.jpg"
    "4 HAB B.jpg"           = "4_HAB_B.jpg"
    "5 HAB A.jpg"           = "5_HAB_A.jpg"
    "5 HAB B.jpg"           = "5_HAB_B.jpg"
    "6 HAB A.jpg"           = "6_HAB_A.jpg"
    "6 HAB B.jpg"           = "6_HAB_B.jpg"
    "7 A.jpg"               = "7_A.jpg"
    "8 A.jpg"               = "8_A.jpg"
    "8 B.jpg"               = "8_B.jpg"
    "9 A.jpg"               = "9_A.jpg"
    "9 B.jpg"               = "9_B.jpg"

    # Índigo & Galeno
    "3 (2).jpg"             = "3__2_.jpg"
    "1 (3).jpg"             = "1__3_.jpg"
    "2_COMEDOR 1B.jpg"      = "2_COMEDOR_1B.jpg"
    "3 SALA 2.jpg"          = "3_SALA_2.jpg"

    # Patrimonio & Territorio
    "RENDER MAQUETA_B.jpg"  = "RENDER_MAQUETA_B.jpg"
    "FINCA EL LLANITO.jpg"  = "FINCA_EL_LLANITO.jpg"

    # Tesis geriátrico
    "PORTADA pro.jpg"       = "PORTADA_pro.jpg"
    "LATERAL pro.jpg"       = "LATERAL_pro.jpg"
    "PLANO 1_PLANTA URBANA OK pro.jpg" = "PLANO_1_PLANTA_URBANA_OK_pro.jpg"

    # Comercial & educativo
    "PLANTA ARQ POST.jpg"   = "PLANTA_ARQ_POST.jpg"
    "PLANTA B.jpg"          = "PLANTA_B.jpg"

    # Proyectos arquitectura
    "CASA 12-3.jpg"         = "CASA_12-3.jpg"
}

$ok = 0
$noEncontrado = 0

foreach ($entrada in $renombrar.GetEnumerator()) {
    $origen  = Join-Path $carpeta $entrada.Key
    $destino = Join-Path $carpeta $entrada.Value

    if (Test-Path $origen) {
        Rename-Item -Path $origen -NewName $entrada.Value
        Write-Host "OK: $($entrada.Key) -> $($entrada.Value)" -ForegroundColor Green
        $ok++
    } else {
        Write-Host "NO encontrado: $($entrada.Key)" -ForegroundColor Yellow
        $noEncontrado++
    }
}

Write-Host ""
Write-Host "Renombrados: $ok archivos" -ForegroundColor Cyan
Write-Host "No encontrados: $noEncontrado archivos" -ForegroundColor Yellow
Write-Host ""
Write-Host "Presiona Enter para cerrar..."
Read-Host
