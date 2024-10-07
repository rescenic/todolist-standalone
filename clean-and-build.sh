#!/bin/bash

echo ""
echo "--> menghapus build sebelumnya..."
rm -rf target

mkdir -p target/classes
mkdir target/mods

echo "--> membuat modul todolist-domain..."
javac -d target/classes/ms.todolist.domain $(find todolist-domain -name '*.java')

jar --create --file target/mods/ms.todolist.domain@1.0.jar \
	-C target/classes/ms.todolist.domain .

echo "--> membuat modul todolist-gui..."
javac --module-path target/mods \
	-d target/classes/ms.todolist.gui $(find todolist-gui -name '*.java')

jar --create --file target/mods/ms.todolist.gui@1.0.jar \
	--main-class ms.todolist.gui.Main \
	-C target/classes/ms.todolist.gui .
