/*NEXT STEPS: Figure out the right index joins nfor temp table #WMI and which fields are needed*/

IF OBJECT_ID('tempdb..#PatternElementsKeylessIgnition') IS NOT NULL DROP TABLE #PatternElementsKeylessIgnition

Select 
p.id as PatternId,
p.elementid,
p.keys,
p.vinschemaid,
p.attributeid,
e.name as ElementName,
e.Description as ElementDescription,
ki.id as KeylessIgnitionId,
ki.name as KeylessIgnitionName
into #PatternElementsKeylessIgnition
FROM pattern p
inner join element e
on p.elementid = e.id
inner join keylessignition ki
on p.attributeid = ki.id
where p.ElementId = '176'
Select * from #PatternElementsKeylessIgnition


IF OBJECT_ID('tempdb..#VinSchema') IS NOT NULL DROP TABLE #VinSchema


Select 
peki.PatternId,
peki.ElementId,
peki.keys,
peki.vinschemaid,
peki.attributeid,
peki.ElementName,
peki.ElementDescription,
peki.KeylessIgnitionId,
peki.KeylessIgnitionName,
vs.Name as VinSchemaName,
wvs.Id as WMI_VinSchemaId__PK,
wvs.WmiId as WorldManufacturerIdentifier_Id,
wvs.YearFrom as WMI_VinSchemaYearFrom,
wvs.YearTo as WMI_VinSchemaYearTo
INTO #VinSchema
From #PatternElementsKeylessIgnition peki
inner join vinschema vs
on peki.vinschemaid = vs.id
inner join WMI_VinSchema wvs
on vs.Id = wvs.VinSchemaId


Select * from #VinSchema
IF OBJECT_ID('tempdb..#WMI') IS NOT NULL DROP TABLE #WMI


Select  
vs.PatternId,
vs.AttributeId,
vs.Keys,
vs.VinSchemaId,
vs.ElementId,
vs.ElementName,
vs.ElementDescription,
vs.KeylessIgnitionId,
vs.KeylessIgnitionName,
vs.VinSchemaName,
vs.WMI_VinSchemaId__PK,
vs.WMI_VinSchemaYearFrom,
vs.WMI_VinSchemaYearTo,
vs.WorldManufacturerIdentifier_Id,
w.MakeId,
w.ManufacturerId,
w.VehicleTypeId,
w.Wmi,
w.TruckTypeId,
wm.makeid as WM_MakeId
--wyvc.wmi as WYVC_WMI,
--wyvc.Year as CarYear,
--wyvc.Position as CarPosition
INTO #WMI
from #VinSchema vs
inner join WMI w
on vs.WorldManufacturerIdentifier_Id = w.id
inner join wmi_make wm
on w.id =wm.wmiid
--inner join WMIYearValidChars wyvc
--on w.wmi = wyvc.wmi


SELECT * FROM #WMI







