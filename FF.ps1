# Constantes
$HelpMessage = @"
Usage: script.ps1 <target_directory> <project_name> [-puv] [-mvc] [-py] [-help]

Options:
    -puv    Create public utils and views structure
    -mvc    Create MVC project structure
    -py     Create Python project structure
    -help   Show this help message
"@

# Função para exibir mensagem de ajuda
function ShowHelp {
    Write-Host $HelpMessage
}

# Para criar Estruturas de Diretórios
function CreateStructure {
    param (
        [string]$Directory,
        [string]$ProjectName,
        [bool]$IsPublicUtilsViews = $false,
        [bool]$IsMVC = $false,
        [bool]$isPy = $false
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
    $directories = @()
    $files = @()

    # Adiciona estrutura para projetos com opção -puv
    if ($IsPublicUtilsViews) {
        $directories += "public", "public\icons", "public\imgs", "public\scripts", "public\scripts\utils", "views", "views\partials"
        $files += ".env", ".gitignore", "index.js", "utils.js", "index.ejs"
    }

    # Adiciona estrutura para projetos com opção -mvc
    if ($IsMVC) {
        $directories += "controllers", "models", "routes"
        $files += ".env", ".gitignore", "index.js", "mainRoute.js", "mainController.js", "mainModel.js"
    }

    # Adiciona estrutura para projetos Python
    if ($isPy) {
        $pyFiles = @("README.md", "requirements.txt", "setup.py", ".gitignore")
        $pyDirectories = @("docs", "tests", "src", "data")
        $pySrcFiles = @("__init__.py", "module1.py", "module2.py")
        
        $directories += $pyDirectories
        $files += $pyFiles
        CreateDirectories -BaseDirectory (Join-Path -Path $Directory -ChildPath $ProjectName) -Directories $pyDirectories
        CreateFiles -BaseDirectory (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "src") -Files $pySrcFiles
    }

    # Criação da estrutura
    CreateDirectories -BaseDirectory (Join-Path -Path $Directory -ChildPath $ProjectName) -Directories $directories
    CreateFiles -BaseDirectory (Join-Path -Path $Directory -ChildPath $ProjectName) -Files $files

    # Mover util.js para public/scripts/utils
    Move-Item -Path (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "utils.js") -Destination (Join-Path -Path (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "public") -ChildPath "scripts\utils\utils.js")

    # Mover index.ejs para views
    Move-Item -Path (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "index.ejs") -Destination (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "views")

    Write-Host "The file structure has been successfully created at $Directory\$ProjectName." -ForegroundColor Green
}

$targetDirectory = $args[0]
$projectName = $args[1]
$isPublicUtilsViews = $args -contains "-puv"
$isMVC = $args -contains "-mvc"
$isPy = $args -contains "-py"

# Verificação de argumentos
if ($args[2] -eq $null) {
    Write-Host "Please provide both target directory and project name." -ForegroundColor Red
    ShowHelp
    exit 1
}

# Verificação da opção escolhida
if ($isPublicUtilsViews -and $isMVC) {
    Write-Host "Please choose either -puv, -mvc or -py, not all." -ForegroundColor Red
    exit 1
}

# Criação da estrutura de diretórios e arquivos
CreateStructure -Directory $targetDirectory -ProjectName $projectName -IsPublicUtilsViews $isPublicUtilsViews -IsMVC $isMVC -IsPy $isPy