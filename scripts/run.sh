#!/usr/bin/env bash

SYS_ROOT=(
  "/mingw64"
  "/usr/x86_64-w64-mingw32"
)

if [ $# -ne 1 ]; then
  echo "%0 <app.exe>"
  exit
fi

exe=`realpath $1`

if [ ! -f $exe ]; then
  echo "$exe does not exists"
  exit
fi

dest_dir=`dirname $exe`

get_deps()
{
  local exe=$1
  local dlls=()
  for i in $(objdump -p $exe |grep "DLL Name:"|awk '{print $3}'); do
    if [ $i == "KERNEL32.dll" ] || [ $i == "msvcrt.dll" ] || [ $i == "USER32.dll" ]; then
      continue
    fi
    for r in ${SYS_ROOT[@]}; do
      local dll=$r/bin/$i
      if [ -f $dll ] && [ ! -f $dest_dir/$i ]; then
	dlls+=($dll)
	cp $dll $dest_dir
	echo "copy  $dll to $dest_dir"
	break
      fi
    done
  done
  for j in ${dlls[@]}; do
    get_deps $j
  done
}

get_deps $exe

$exe
