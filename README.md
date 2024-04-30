# FileForge 🛠️

FileForge é uma ferramenta de linha de comando para criar estruturas de diretórios e arquivos para diferentes tipos de projetos de desenvolvimento de software.

---

O FileForge é uma ferramenta de linha de comando projetada para simplificar e agilizar o processo de criação de estruturas de diretórios e arquivos para projetos de desenvolvimento de software. Com este programa, os desenvolvedores podem facilmente gerar estruturas de pastas e arquivos para uma variedade de tipos de projetos, incluindo aqueles que seguem padrões específicos, como arquitetura MVC (Model-View-Controller) ou projetos Python. Oferecendo suporte amplo e feedback visual claro, o FileForge é uma solução conveniente para configurar rapidamente a base de um projeto, permitindo que os desenvolvedores se concentrem mais no desenvolvimento de software e menos na organização inicial do projeto.

## Instalação 🚀

1. Faça o download ou clone este repositório para o seu computador.
2. Certifique-se de ter o PowerShell instalado no seu sistema.
3. Navegue até o diretório onde você baixou/clonou o repositório.
4. Execute o script `script.ps1` usando o PowerShell.

## Como Usar 📝

```
.\script.ps1 <target_directory> <project_name> [-puv] [-mvc] [-py] [-help]
```

### Opções:

- `-puv`: Cria a estrutura de diretórios e arquivos para um projeto com estrutura de diretórios públicos, utils e views.
- `-mvc`: Cria a estrutura de diretórios e arquivos para um projeto seguindo o padrão de arquitetura MVC (Model-View-Controller).
- `-py`: Cria a estrutura de diretórios e arquivos para um projeto Python.
- `-help`: Exibe a mensagem de ajuda com informações sobre como usar o script.

## Features ✨

- **Rápido e Fácil**: Criação rápida e fácil de estruturas de diretórios e arquivos para diferentes tipos de projetos.
- **Suporte Amplo**: Suporte para projetos com estrutura de diretórios públicos, utils e views, arquitetura MVC e projetos Python.
- **Feedback Visual**: Mensagens de feedback coloridas para indicar o sucesso ou falha da criação da estrutura.

## Troubleshooting ❓

Se encontrar problemas ao usar o FileForge, verifique o seguinte:

- **PowerShell**: Certifique-se de ter o PowerShell instalado e configurado corretamente no seu sistema.
- **Permissões**: Verifique se você tem permissões suficientes para criar diretórios e arquivos no diretório de destino.
- **Issues**: Se encontrar erros específicos, consulte a seção de [Issues](https://github.com/Gustavo2022003/FileForge/issues) ou abra uma nova Issue para relatar o problema.

## Contribua e Reporte Problemas 🤝

Se tiver dúvidas, sugestões de melhorias ou encontrar bugs, sinta-se à vontade para abrir uma nova Issue no [repositório do projeto](https://github.com/Gustavo2022003/FileForge/issues). Estamos sempre abertos a feedback e contribuições!

## Para mais informações ℹ️

Visite o [repositório do projeto](https://github.com/Gustavo2022003/FileForge) para mais detalhes e atualizações.

Claro, aqui está uma sessão que explora os possíveis erros que o programa pode apresentar e como lidar com eles:

## Possíveis Erros e Soluções 🛠️

Durante o uso do FileForge, você pode encontrar alguns erros comuns. Aqui estão alguns dos problemas mais frequentes e suas soluções correspondentes:

### 1. Erro de Permissão Negada ao Criar Diretório ou Arquivo

**Problema**: Você recebe uma mensagem de erro indicando que não tem permissão para criar um diretório ou arquivo no diretório de destino.

**Solução**: Verifique suas permissões de usuário no sistema operacional. Certifique-se de que você tenha permissões de escrita no diretório de destino. Se estiver executando o script em um ambiente controlado por políticas de segurança, entre em contato com o administrador do sistema para obter assistência.

### 2. Projeto com Nome Duplicado

**Problema**: Você tenta criar um projeto com um nome que já existe no diretório de destino.

**Solução**: Escolha um nome diferente para o projeto ou exclua o projeto existente antes de tentar criar um novo com o mesmo nome. Certifique-se de verificar o diretório de destino antes de criar um novo projeto para evitar conflitos de nome.

### 3. Erro ao Executar o Script

**Problema**: Você recebe um erro ao tentar executar o script `script.ps1`.

**Solução**: Verifique se o PowerShell está instalado corretamente no seu sistema e se você está usando o comando correto para executar o script. Certifique-se também de estar no diretório correto onde o script está localizado. Se o problema persistir, verifique se há erros de sintaxe no script ou se há dependências ausentes.

### 4. Erro ao Mover Arquivos

**Problema**: O script não consegue mover alguns arquivos para seus destinos finais.

**Solução**: Verifique se os diretórios de destino estão corretamente criados e se o script tem permissão para acessá-los. Certifique-se de que os nomes dos arquivos e diretórios estejam corretos e que não haja conflitos de nome. Se necessário, verifique as permissões de escrita e acesso no sistema de arquivos.

### 5. Problemas de Configuração do Ambiente

**Problema**: O script não funciona como esperado devido a configurações de ambiente incorretas.

**Solução**: Certifique-se de que todas as configurações de ambiente necessárias estejam corretamente configuradas. Isso pode incluir variáveis de ambiente, configurações do PowerShell, permissões de usuário e outros fatores que podem afetar a execução do script. Consulte a documentação do FileForge e do PowerShell para obter mais informações sobre as configurações de ambiente necessárias.

Se você encontrar outros erros ou problemas ao usar o FileForge, sinta-se à vontade para relatar o problema abrindo uma nova Issue no [repositório do projeto](https://github.com/Gustavo2022003/FileForge/issues). Estamos aqui para ajudar e resolver quaisquer problemas que você possa enfrentar durante o uso da ferramenta.
