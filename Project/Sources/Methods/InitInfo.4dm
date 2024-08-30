//%attributes = {"invisible":true}

var Infos; LinesCode : Collection
var objTabs : Object

Infos:=ds:C1482.INFO.query("PageNumber < :1"; 10).orderBy("PageNumber").toCollection()
objTabs:=New object:C1471("values"; Infos.extract("TabTitle"); "index"; 0)

LinesCode:=ds:C1482.INFO.query("PageNumber >= :1"; 10).orderBy("PageNumber").toCollection()