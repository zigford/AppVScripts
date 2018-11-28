# PackagingScripts
Scripts and templates for APPV Packaging

## Templates

A Set of template files for automating creation of an appv package

Create a new recipe by running 'New-PackageRecipe', which will 
prompt for some parameters and create a corresponding 'recipe' directory
under the 'Recipes' directory.

## Recipes

Scripts customized for silently creating an APPV package.
Typically consists of:
* CreatePackage.bat is the main script launched to create the package.
* specfile.bat which specifies the package name, and APPV settings.
* InstallSoftware.bat Commands used to install the software silently.
* appvtemplate.appvt

## Scripts

Scripts used in non-appv package deployment

## USC-APPV

A powershell module to automate modifying APPV deployment XML files.
