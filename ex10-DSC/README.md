## Build a PowerShell Module with DSC 'Stuff'

Start with creating a Module manifest, without a `rootmodule`.

```powershell
# Create the MyDSCModule folder:
New-Item -ItemType Directory -Path ex10-DSC\MyDSCModule -ErrorAction Ignore
New-ModuleManifest -Path .\ex10-DSC\MyDSCModule\MyDSCModule.psd1 -ModuleVersion 0.0.1 -Description 'Just a test module'
```

### DSC Resource

A DSC resource is a code construct that enables an idempotent interface to manage a resource.
If we want to manage a File (our resource) with DSC, we can write a DSC Resource to change the properties of the file.

#### The MOF Resource

It is not preferable to create MOF based resources anymore, but I can show an example.

#### The Class based Resource

Create a module named `MyDSCModule` with a rootModule PSM1.
in that psm1 write a DSC Class with:

- The DSC Resource attribute for the class: `[DscResource()]`
- The DSC Properties' attributes as required: `[DscProperty()]`, `[DscProperty(key)]`, `[DscProperty(Mandatory)]`, `[DscProperty(NotConfigurable)]`
- the `[ClassName] Get() {...}` method
- the `[bool] Test() {...}` method
- the `[void] Set() {...}` method

### Composite

Create a DSCResource folder at the module root level.
Add the composite name as a folder underneath (`./MyDSCModule/DSCResource/MyDSCComposite`)
Within that last folder add a Module manifest CompositeName.psd1 and a psm1 file named `CompositeName.schema.psm1` that uses the `configuration` keyword.

