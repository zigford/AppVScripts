# PackagingScripts
Scripts and templates for APPV Packaging

## Templates

A Set of template files for automating creation of an appv package

Create a new recipe by running 'New-PackageRecipe.ps1' from the templates
directory, which will prompt for some parameters and create a corresponding
'recipe' directory under the 'Recipes' directory.

## Recipes

Scripts customized for silently creating an APPV package.

Recipes are stored in the following tree structure:

```
\Recipes\Vendor\Product\Version\
                                APPV
                                Working Files
                                Source
```

The recipe scripts are in the 'Working Files'. Source and generated APPV packages
are not tracked in this repo.

### Quick descripton on "Working Files"

| File           | Purpose                                     | Mandatory |
|----------------|---------------------------------------------|-----------|
| specfile.bat   | Specify package name, PVAD, Install scripts | Yes       |
| Install script | Script to silently install software.        | Yes       |
| appv template  | Specify and appv template                   | No        |

In order to use a recipe, clone the repository and copy `CreatePackage.bat`
into "Working Files". Then double click it from the clean machine. 

## Scripts

Scripts used in general package deployment.

    InstallSoftware.vbs

Runs a .clist file of commands and records their exit codes and output into a
log.

    ConvertTo-EncodedCommand.ps1

Quick and dirty powershell to encode command/(s) in the form of a string into
Base64 content which can be used for embedding into an AppV Deployment.XML
file.

## USC-APPV

A powershell module to automate modifying APPV deployment XML files.
