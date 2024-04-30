# Constantes
$HelpMessage = @"
Usage: script.ps1 <target_directory> <project_name> [-puv] [-mvc] [-py] [-help]

Options:
    -puv    Create public utils and views structure
    -mvc    Create MVC project structure
    -py     Create Python project structure
    -help   Show this help message

For more information visit: https://github.com/Gustavo2022003/FileForge
`n
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
        [bool]$IsPy = $false,
        [bool]$IsHelp = $false
    )

    # Verificação de ajuda
    if ($IsHelp) {
        ShowHelp
        exit 0
    }

    # Verificação de diretório
    if (-not (Test-Path -Path $Directory)) {
        Write-Host "The target directory does not exist.`n" -ForegroundColor Red
        exit 1
    }

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

    $folders = Get-ChildItem -Path $Directory -Directory | Where-Object { $_.Name -eq $ProjectName }

    if ($folders.Count -gt 0) {
        Write-Host "The project with name ""$ProjectName"" already exists in the target directory.`n" -ForegroundColor Red
        exit 1
    }

    # Estrutura base
    $directories = @()
    $files = @()

    if ($IsPublicUtilsViews) {
        $directories += "public", "public\icons", "public\imgs", "public\scripts", "public\scripts\utils", "views", "views\partials"
        $files += ".env", ".gitignore", "index.js", "utils.js", "index.ejs"
    }

    if ($IsMVC) {
        $directories += "controllers", "models", "routes"
        $files += ".env", ".gitignore", "index.js", "routes\mainRoute.js", "controllers\mainController.js", "models\mainModel.js"
    }

    if ($IsPy) {
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
    if ($IsPublicUtilsViews) {
        Move-Item -Path (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "utils.js") -Destination (Join-Path -Path (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "public") -ChildPath "scripts\utils\utils.js")

        # Mover index.ejs para views
        Move-Item -Path (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "index.ejs") -Destination (Join-Path -Path (Join-Path -Path $Directory -ChildPath $ProjectName) -ChildPath "views")
    }

    Write-Host "The file structure has been successfully created at $Directory\$ProjectName.`n" -ForegroundColor Green
}


$targetDirectory = $args[0]
$projectName = $args[1]
$isPublicUtilsViews = $args -contains "-puv"
$isMVC = $args -contains "-mvc"
$isPy = $args -contains "-py"
$isHelp = $args -contains "-help"

# Verifica se pelo menos um argumento válido foi passado
if (-not ($isMVC -or $isPublicUtilsViews -or $isPy -or $isHelp)) {
    $invalid_arg = $args[2]
    Write-Host "`nYou must specify at least one of the following options: -puv, -mvc or -py.`n" -ForegroundColor Red
    ShowHelp
    exit 1
}

if($args.Count -ge 4 -and $isHelp -eq $false) {
    Write-Host "`nInvalid number of arguments.`n" -ForegroundColor Red
    ShowHelp
    exit 1
}

# Criação da estrutura de diretórios e arquivos
CreateStructure -Directory $targetDirectory -ProjectName $projectName -IsPublicUtilsViews $isPublicUtilsViews -IsMVC $isMVC -IsPy $isPy -IsHelp $isHelp