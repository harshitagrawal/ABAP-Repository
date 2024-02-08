# Convert OData metadata to OpenAPI docs

The script is a Windows PowerShell script that automates the creation of OpenAPI documents for **Domain APIs of S/4 TRBK** (OData V4 APIs).
A local folder _"OpenAPI Temp Docs"_ is created in _"MyDocuments"_. A subfolder is created for the ABAP system (SID).  
You can find all documents of the last run in this folder.
The documents (edmx.xml, openapi3.json, and openapi3.yaml) are uploaded to the corresponding folder on _SharePoint_.  
>
>- SharePoint: [Banking Architecture](https://sap.sharepoint.com/sites/60004748)  
>- Folder: _["/Shared Documents/6.) PIC/70 Final Approved Documents/10 EDMs/\<Domain API\>/CB4HANA/OpenAPI"](https://sap.sharepoint.com/:f:/r/sites/60004748/Shared%20Documents/6.\)%20PIC/70%20Final%20Approved%20Documents/10%20EDMs?csf=1&web=1&e=8J9nEV)_  
>- The credentials of the current Windows user are used to connect to SharePoint.  

## Documentation of Domain APIs  

The documents on SharePoint are attached to SAP Notes. The SAP Notes are used to publish the OpenAPI documents as long as we do not publish the APIs on SAP Business Hub.  
> Therefore be ***careful especially*** with the script for the test system of S/4 TRBK 1.0. The documents are uploaded to subfolder "CB4HANA 100" on SharePoint. These documents are attached to a SAP Note.  
The collection note is SAP Note [283692](https://launchpad.support.sap.com/#/notes/2839692 "OData APIs in Transactional Banking").  
  
- SAP Note [283692](https://launchpad.support.sap.com/#/notes/2839692 "OData APIs in Transactional Banking")  
- SAP Help Portal - [Domain APIs](https://help.sap.com/viewer/d2151b51aacc4d82ad2861e007337fa2/latest/en-US/c16ab45f3212497a9ae77a5c9dcb77ea.html)

## Usage of Script  

The ***user*** has two options to run the script:  

- for all Domain APIs or  
- for a selected Domain API.

A popup is shown for the selection.  
The script uses two tools which need to be installed (see prerequisites below).
You need to copy the script and the module to your computer if you want to use it. The module folder has to be copied in the same folder as the script. Common functions of both scripts are implemented in the module [Main_DomainAPI-odata-openapi](https://sap.sharepoint.com/:u:/r/sites/102277/Shared%20Documents/10_S4HANA%20TRBK%20%201.0/Architecture/Integration/Scripts%20Domain%20API%20(OData%20to%20OpenAPI)/Modules/Main_DomainAPI-odata-openapi/Main_DomainAPI-odata-openapi.psm1?csf=1&web=1&e=vIxhe9) in folder [Modules](https://sap.sharepoint.com/:f:/r/sites/102277/Shared%20Documents/10_S4HANA%20TRBK%20%201.0/Architecture/Integration/Scripts%20Domain%20API%20(OData%20to%20OpenAPI)/Modules/Main_DomainAPI-odata-openapi?csf=1&web=1&e=Ts6YTD).

The easiest way to copy the scripts and the module is to "sync" the folder [Scripts Domain API (OData to OpenAPI](https://sap.sharepoint.com/:f:/r/sites/102277/Shared%20Documents/10_S4HANA%20TRBK%20%201.0/Architecture/Integration/Scripts%20Domain%20API%20(OData%20to%20OpenAPI)?csf=1&web=1&e=XY3lsw) on SharePoint.

>**Shortcut:**  
>
> - It is recommended to run the script via a shortcut. Create a shortcut in Windows with the following location (example):
>**%windir%\System32\WindowsPowerShell\v1.0\powershell.exe -noexit -File** _"C:\Users\xxxxxx\SAP SE\S 4HANA Transactional Banking - Integration\Scripts Domain API (OData to OpenAPI)\FIB_DomainAPI-odata-openapi.ps1"_  
> - The 1st part is the location of powershell.exe
> - The 2nd part is the location of the script.
> - You can place the shortcut on the desktop or somewhere else.

## Script Versions

Different version of the script exists for the different ABAP systems (infinity, maintenance system landscape of S/4 TRBK).

- Script for [S4 TRBK Infinity](https://sap.sharepoint.com/:u:/r/sites/102277/Shared%20Documents/10_S4HANA%20TRBK%20%201.0/Architecture/Integration/Scripts%20Domain%20API%20(OData%20to%20OpenAPI)/FIB_DomainAPI-odata-openapi.ps1?csf=1&web=1&e=pfd2Sb)  
  - ABAP development system FIB

- Script for [S4 TRBK 1.0](https://sap.sharepoint.com/:u:/r/sites/102277/Shared%20Documents/10_S4HANA%20TRBK%20%201.0/Architecture/Integration/Scripts%20Domain%20API%20(OData%20to%20OpenAPI)/F7V_DomainAPI-odata-openapi.ps1?csf=1&web=1&e=2Crgsh)
  - ABAP test system F7V  

## Details of script

  The script converts an OData V4 metadata document (.edmx.xml) into a openapi3 json and yaml document
  The major functions:  

  1. **`copy_metadata`**  
     Downloads the metadata (.edmx.xml) from a ABAP system and stores the document in the local download folder. User PIAPPLUSER is used for the call to the ABAP system.  
   The metadata document needs to contain annotations with the content of the PIC excel.  
  2. **`odata2openAPI`**  
     Converts the metadata (.edmx.xml) into a OpenAPI 3.0 document (openapi3.json) in the local download folder  
  3. **`openapi_json2yaml`**  
     Converts the OpenAPI 3.0 document (openapi3.json) into a yaml document (openapi3.yaml) in the local download folder  
  4. **`pretty-print-edmx_xml`**  
     Runs a pretty printer for the .edmx.xml file.
     The pretty printer allows a better readability of .edmx.xml file  
     (The pretty printer has to run after odata2openapi otherwise odata2openapi does not work.)  
  5. **`uploadDocsToSharePoint`**  
     Uploads the documents from local download folder to a SharePoint folder  

The functions are called in function `OpenAPI_for_DomainAPI`. If you do not want to upload the documents to SharePoint you can, for example, comment the function `UploadDocsToSharePoint` by '#'. You could do the same with `openapi_json2yaml` if you don't want to install `api-spec-converter`.

## OpenAPI Viewer  

You can use [Swagger Editor](http://editor.swagger.io/) to display the .openapi3.json or openapi3.yaml document.  

Alternative viewers are:

- [Swagger UI](https://github.com/swagger-api/swagger-ui)  
  Swagger UI needs to be installed on your computer.  
  (SRI: not listed)
- [Visual Studio Code](https://code.visualstudio.com/)  
  You can view the OpenAPI document with the extension [Swagger Viewer](https://marketplace.visualstudio.com/items?itemName=Arjun.swagger-viewer) like in Swagger Editor and Swagger UI.  
  (SRI: [Grey-listed](https://sri.wdf.sap.corp/Search/Details/19661?sID=213))  
  APIs with cross-navigation (containing an external type) are currently not displayed. Seems to be a bug.

## Prerequisites

### `odata-openapi3`

Converts OData 4.0x XML to OpenAPI 3.0.x
The tool is based on JavaScript.  
> Installation details here: [odata-openapi3](https://github.com/oasis-tcs/odata-openapi/tree/master/lib)  
> You need to sign-in to github for download.  

### `api-spec-converter`

Converts OpenAPI 3.0 from json to yaml.
> Installation details here: [api-spec-converter](https://github.com/LucyBot-Inc/api-spec-converter)  
> You need to sign-in to github for download.  

### node.js

Node.js is required to install `odata-openapi3` and `api-spec-converter`.  
You can use Windows Installer (.msi) on a Windows computer.  
> Installation details here: [node.js](https://nodejs.org/en/download/)  

### PnP PowerShell

SharePointPnPPowerShellShellOnline is required to connect to SharePoint and upload the documents.  
> Installation details here: [PnP PowerShell](https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps)  

###### Contact: [Dirk Becker](https://people.wdf.sap.corp/profiles/D022109)  

---
Markdown syntax:
[Guide for markdown syntax](https://www.markdownguide.org/basic-syntax/)
