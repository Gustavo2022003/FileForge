# Constantes
$HelpMessage = @"
Usage: script.ps1 <target_directory> <project_name> [-puv] [-mvc] [-help]

Options:
    -puv    Create public utils and views structure
    -mvc    Create MVC project structure
    -help   Show this help message
"@

# Função para exibir mensagem de ajuda
function ShowHelp {
    Write-Host $HelpMessage
}

# Função para criar estrutura de diretórios e arquivos
function CreateStructure {
    param (
        [string]$Directory,
        [string]$ProjectName,
        [bool]$IsPublicUtilsViews = $false,
        [bool]$IsMVC = $false
    )

    # Função interna para criar diretórios
    function CreateDirectories {
        param ([string]$BaseDirectory, [string[]]$Directories)
        $Directories | ForEach-Object {
            $fullPath = Join-Path -Path $BaseDirectory -ChildPath $_
            New-Item -ItemType Directory -Path $fullPath -ErrorAction SilentlyContinue | Out-Null
        }
    }

    # Função interna para criar arquivos
    function CreateFiles {
        param ([string]$BaseDirectory, [string[]]$Files)
        $Files | ForEach-Object {
            $fullPath = Join-Path -Path $BaseDirectory -ChildPath $_
            New-Item -ItemType File -Path $fullPath -ErrorAction SilentlyContinue | Out-Null
        }
    }

    # Estrutura base
    $directories = @("public", "utils", "views")
    $publicDirectories = @("icons", "imgs", "scripts", "partials")
    $files = @(".env", ".gitignore", "index.js")

    # Estrutura adicional para MVC
    if ($IsMVC) {
        $directories += "controllers", "models", "routes"
        $files += "mainRoute.js", "mainController.js", "mainModel.js"
    }

    # Criação da estrutura
    CreateDirectories -BaseDirectory (Join-Path -Path $Directory -ChildPath $ProjectName) -Directories $directories
    CreateDirectories -BaseDirectory (Join-Path -Path $Directory -ChildPath "$ProjectName\public") -Directories $publicDirectories
    CreateFiles -BaseDirectory (Join-Path -Path $Directory -ChildPath $ProjectName) -Files $files

    # Criação de arquivos específicos
    New-Item -ItemType File -Path (Join-Path -Path (Join-Path -Path $Directory -ChildPath "$ProjectName\public\scripts") -ChildPath "script.js") -ErrorAction SilentlyContinue | Out-Null
    New-Item -ItemType File -Path (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "public\style.css") -ErrorAction SilentlyContinue | Out-Null

    Write-Host "The file structure has been successfully created at $Directory\$ProjectName." -ForegroundColor Green
}

$targetDirectory = $args[0]
$projectName = $args[1]
$isPublicUtilsViews = $args -contains "-puv"
$isMVC = $args -contains "-mvc"

# Verificação de argumentos
if ($args[2] -eq $null) {
    Write-Host "Please provide both target directory and project name." -ForegroundColor Red
    ShowHelp
    exit 1
}

# Verificação da opção escolhida
if ($isPublicUtilsViews -and $isMVC) {
    Write-Host "Please choose either -puv or -mvc, not both." -ForegroundColor Red
    exit 1
}

# Criação da estrutura de diretórios e arquivos
CreateStructure -Directory $targetDirectory -ProjectName $projectName -IsPublicUtilsViews $isPublicUtilsViews -IsMVC $isMVC